//
//  TaskTableViewCell.swift
//  TestTask
//
//  Created by Ihor Karalash on 05.03.2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var sourceCell: UILabel!
    @IBOutlet weak var authorCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    
    
    static let identifier = "TaskTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TaskTableViewCell", bundle: nil)
    }
    
    public func configure(with title: String, source: String, description: String, author: String, imageURL: String){
        titleCell.text = title
        sourceCell.text = source
        descriptionCell.text = description
        authorCell.text = author
        
        guard let url = URL(string: imageURL) else {
            imageCell.image = UIImage(systemName: "gear")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.imageCell.image = image
            }
        }
        task.resume()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
