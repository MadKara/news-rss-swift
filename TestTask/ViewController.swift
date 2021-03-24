//
//  ViewController.swift
//  TestTask
//
//  Created by Ihor Karalash on 05.03.2021.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    /*func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchbar.resignFirstResponder()
        if let text = searchbar.text {
            filteredArticle = []
            
            
            table.reloadData()
        }
    }*/
    /*
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height * 4) && !isLoading {
            loadMoreData()
        }
    }
    
    func loadMoreData(){
        if !self.isLoading{
            self.isLoading = true
            DispatchQueue.global().async {
                sleep(2)
                
                DispatchQueue.main.async { //!!!!!!!!
                    self.table.reloadData()
                    self.isLoading = false
                }
            }
        }
    }
    */
}



