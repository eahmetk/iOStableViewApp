//
//  ViewController.swift
//  landMarkBook
//
//  Created by Ahmet on 21.12.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var selectedNameCountry = ""
    var selectedImageCountry = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("roma")
        landmarkNames.append("malatya")
        landmarkNames.append("dublin")
        landmarkNames.append("eyfel")
        
        landmarkImages.append(UIImage(named: "roma")!)
        landmarkImages.append(UIImage(named: "malatya")!)
        landmarkImages.append(UIImage(named: "dublin")!)
        landmarkImages.append(UIImage(named: "eyfel")!)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text=landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNameCountry = landmarkNames[indexPath.row]
        selectedImageCountry = landmarkImages[indexPath.row]
        
        
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{
            let destinationVC=segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = selectedNameCountry
            destinationVC.selectedLandmarkImage = selectedImageCountry
        }
    }
    
    
}

