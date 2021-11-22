//
//  DetailViewController.swift
//  foodpin
//
//  Created by Tsuen Hsueh on 2021/11/8.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var sportImageView: UIImageView!
    
    var sportImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sportImageView.image = UIImage(named: sportImageName)
    }
    
}
