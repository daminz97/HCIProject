//
//  HomeViewController.swift
//  HCIProject4
//
//  Created by Humad Syed on 12/12/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

enum ArrowState{
    case off
    case up
    case down
}

class ModalViewController: UIViewController {
    
    @IBOutlet weak var nameArrow: UIImageView!
    @IBOutlet weak var dateArrow: UIImageView!
    @IBOutlet weak var platformArrow: UIImageView!
    
    var arrowStates: [ArrowState] = []
    var arrowImages: [UIImageView] = []
    var wishlist: WishListViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrowImages = [nameArrow, dateArrow, platformArrow]
        updateArrows()
    }
    
    func updateArrows(){
        nameArrow.image = arrowStates[0] == .off ? nil : arrowStates[0] == .up ? #imageLiteral(resourceName: "arrow_up") : #imageLiteral(resourceName: "arrow_down")
        dateArrow.image = arrowStates[1] == .off ? nil : arrowStates[1] == .up ? #imageLiteral(resourceName: "arrow_up") : #imageLiteral(resourceName: "arrow_down")
        platformArrow.image = arrowStates[2] == .off ? nil : arrowStates[2] == .up ? #imageLiteral(resourceName: "arrow_up") : #imageLiteral(resourceName: "arrow_down")
    }
    
    func othersOff(_ index:Int){
        for i in 0..<3{
            if i != index{
                arrowStates[i] = .off
            }
        }
    }
    
    @IBAction func backgroundPressed(_ sender: UIButton) {
        wishlist?.arrowStates = arrowStates
        self.dismiss(animated: true, completion: nil)
    }
    
    func pressButton(at index:Int){
        othersOff(index)
        switch (arrowStates[index]){
        case .off:
            arrowImages[index].image = #imageLiteral(resourceName: "arrow_up")
            arrowStates[index] = .up
            wishlist?.sort(by: index, direction: "up")
            break
        case .up:
            arrowImages[index].image = #imageLiteral(resourceName: "arrow_down")
            arrowStates[index] = .down
            wishlist?.sort(by: index, direction: "down")
            break
        case .down:
            arrowStates[index] = .off
            break
        }
        updateArrows()
    }
    
    @IBAction func namePressed(_ sender: UIButton) {
        pressButton(at: 0)
    }
    
    @IBAction func datePressed(_ sender: UIButton) {
        pressButton(at: 1)
    }
    
    @IBAction func platformPressed(_ sender: UIButton) {
        pressButton(at: 2)
    }
}
