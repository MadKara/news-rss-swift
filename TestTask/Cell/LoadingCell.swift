//
//  LoadingCell.swift
//  TestTask
//
//  Created by Ihor Karalash on 14.03.2021.
//

import UIKit

class LoadingCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    static let identifier = "LoadingCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "LoadingCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
