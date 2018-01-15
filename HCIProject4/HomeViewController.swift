//
//  HomeViewController.swift
//  HCIProject4
//
//  Created by Humad Syed on 12/12/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let views = mainView.subviews
        mainView.backgroundColor = UIColor(red: 232/255, green: 246/255, blue: 249/255, alpha: 1)
        for card in views{
            card.layer.cornerRadius = 5
            card.layer.masksToBounds = false
            card.layer.shadowPath = UIBezierPath(rect: card.bounds).cgPath
            card.layer.shadowColor = UIColor.black.cgColor
            card.layer.shadowOffset = CGSize(width: -2, height: 3)
            card.layer.shadowRadius = 2;
            card.layer.shadowOpacity = 0.5
            card.backgroundColor = UIColor(red: 205/255, green: 241/255, blue: 249/255, alpha: 1)

        }
        // Do any additional setup after loading the view.
    }
}
