//
//  WebViewController.swift
//  TestTask
//
//  Created by Ihor Karalash on 12.03.2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var link: String = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: link)
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }

}
