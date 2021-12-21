//
//  imageViewController.swift
//  landMarkBook
//
//  Created by Ahmet on 21.12.2021.
//

import UIKit

class imageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var landMarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landMarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        

    }
}
