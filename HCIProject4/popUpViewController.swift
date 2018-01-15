//
//  popUpViewController.swift
//  HCIProject4
//
//  Created by Humad Syed on 12/15/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class popUpViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var nameArrow: UIImageView!
    @IBOutlet weak var dateArrow: UIImageView!
    @IBOutlet weak var platformArrow: UIImageView!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var platformButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    
    // 0 == not selected, 1 == ascending, 2 == descending
    var sortByName = 0
    var sortByDate = 0
    var sortByPlatform = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nameButtonPressed(_ sender: Any){
        
        dateArrow.image = nil
        platformArrow.image = nil
        sortByDate = 0
        sortByPlatform = 0
        
        if (sortByName == 0 || sortByName == 2) {
            sortByName = 1
            nameArrow.image = UIImage(named: "arrow_up")
        } else {
            sortByName = 2
            nameArrow.image = UIImage(named: "arrow_down")
        }
    }
    
    @IBAction func dateButtonPressed(_ sender: Any){
        
        nameArrow.image = nil
        platformArrow.image = nil
        sortByName = 0
        sortByPlatform = 0
        
        if (sortByDate == 0 || sortByDate == 2) {
            sortByDate = 1
            dateArrow.image = UIImage(named: "arrow_up")
        } else {
            sortByDate = 2
            dateArrow.image = UIImage(named: "arrow_down")
        }
    }
    
    @IBAction func platformButtonPressed(_ sender: Any){
        
        nameArrow.image = nil
        dateArrow.image = nil
        sortByName = 0
        sortByDate = 0
        
        if (sortByPlatform == 0 || sortByPlatform == 2) {
            sortByPlatform = 1
            platformArrow.image = UIImage(named: "arrow_up")
        } else {
            sortByPlatform = 2
            platformArrow.image = UIImage(named: "arrow_down")
        }
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
