//
//  ImportViewController.swift
//  HCIProject4
//
//  Created by RAISE on 12/12/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class ImportViewController : UIViewController {
    
    @IBOutlet weak var steamUsername: UITextField!
    @IBOutlet weak var steamPassword: UITextField!
    @IBOutlet weak var xboxIcon: UIImageView!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBAction func xboxSyncPressed(_ sender: UIButton) {
        xboxIcon.image = #imageLiteral(resourceName: "ps4")
    }
    
    
    @IBOutlet weak var xbox: UIView!
    @IBOutlet weak var ps4: UIView!
    @IBOutlet weak var steam: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cards = [xbox,ps4,steam]
        cards.forEach{ card in
            card!.layer.cornerRadius = 5
            card!.layer.masksToBounds = false
            card!.layer.shadowPath = UIBezierPath(rect: card!.bounds).cgPath
            card!.layer.shadowColor = UIColor.black.cgColor
            card!.layer.shadowOffset = CGSize(width: -2, height: 3)
            card!.layer.shadowRadius = 2;
            card!.layer.shadowOpacity = 0.5
        }
    }
    
    @IBAction func syncPressed(_ sender: UIButton) {
        if (steamUsername.text != "" || steamPassword.text != ""){
            if sender.currentTitle == "SYNC"{
                var passwordDisplay = ""
                for _ in 0..<(steamPassword.text?.characters.count)!{
                    passwordDisplay = passwordDisplay + "*"
                }
                passwordLabel.text = passwordDisplay
                usernameLabel.text = steamUsername.text
                steamUsername.isHidden = true
                steamPassword.isHidden = true
                sender.setTitle("DESYNC", for: UIControlState.normal)
            } else {
                steamUsername.isHidden = false
                steamPassword.isHidden = false
                steamUsername.text = ""
                steamPassword.text = ""
                steamPassword.resignFirstResponder()
                steamUsername.resignFirstResponder()
                sender.setTitle("SYNC", for: UIControlState.normal)
                passwordLabel.text = ""
                usernameLabel.text = ""
            }
        }
    }
    
}
