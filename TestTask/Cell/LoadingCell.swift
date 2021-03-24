//
//  LoadingCell.swift
//  TestTask
//
//  Created by Ihor Karalash on 14.03.2021.
//

import UIKit

class LoadingCell: UITableViewCell {

    
    static let identifier = "LoadingCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "LoadingCell", bundle: nil)
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
