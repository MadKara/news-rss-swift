//
//  TableViewController.swift
//  TestTask
//
//  Created by Ihor Karalash on 22.03.2021.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var articles: [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TaskTableViewCell.nib(), forCellReuseIdentifier: TaskTableViewCell.identifier)
        tableView.register(LoadingCell.nib(), forCellReuseIdentifier: LoadingCell.identifier)
       
        tableView.dataSource = self
        tableView.delegate = self
        
        let apiService = ApiService()
        apiService.getNews(completion: fetchNews)
    }
    
    func fetchNews(result: Result<[Article], Error>) -> Void {
        do {
            articles = try result.get();
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Error retrieving the value: \(error)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return articles.count
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 150
        } else{
            return 100
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
     if indexPath.section == 0{
         let title = articles[indexPath.row].title
         let source = articles[indexPath.row].source.name
         let description = articles[indexPath.row].description
         let author = articles[indexPath.row].author ?? "No author"
         let image = articles[indexPath.row].urlToImage ?? ""
         
         let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as! TaskTableViewCell
         cell.configure(with: title, source: source, description: description, author: author, imageURL: image)
         return cell
     } else {
         let cell = tableView.dequeueReusableCell(withIdentifier: LoadingCell.identifier, for: indexPath) as! LoadingCell
         cell.activityIndicator.startAnimating()
         return cell
     }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showLinks", sender: self)
                
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "showLinks" {
             if let indexPath = tableView.indexPathForSelectedRow {
                 let destination = segue.destination as? WebViewController
                 destination?.link = articles[indexPath.row].url
             }
         }
     }
    

}
