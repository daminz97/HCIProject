//
//  WishListViewController.swift
//  HCIProject4
//
//  Created by Humad Syed on 12/15/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController{

    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var overwatch: UIView!
    @IBOutlet weak var halflife: UIView!
    @IBOutlet weak var gears: UIView!
    @IBOutlet weak var minecraftPC: UIView!
    @IBOutlet weak var minecraftXbox: UIView!
    
    @IBOutlet weak var searchHolder: UIView!
    var cards: [UIView] = []
    var locations: [CGRect] = []
    var info: [(String, Int, String)] = []
    
    var canSwipeLeft = true
    var canSwipeRight = false
    var cardToDelete: UIView? = nil
    var trash: UIButton? = nil
    open var arrowStates: [ArrowState] = [.off, .off, .off]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = [overwatch, halflife, gears, minecraftPC]
        defineLocations()
        print(locations, "\n\n\n\n\n!@#$%^&*(")
        info = cards.map{ card in
            let data = card.accessibilityLabel
            let parts = data?.characters.split(separator: " ").map(String.init)
            return (parts![1], Int(parts![2])!, parts![3])
        }
        cards.forEach{ card in
            card.removeConstraints(self.view.constraints)
        }
        initializeSwipes()
        roundedAndShadows()
    }
    
    func defineLocations(){
        let start = searchHolder.frame.origin
        let gap = CGFloat(121)
        for i in 0..<3{
            locations.append(CGRect(origin: CGPoint(x: start.x, y: start.y+CGFloat(i)*gap), size: overwatch.frame.size))
        }
    }
    
    func roundedAndShadows(){
        self.cards.forEach{ card in
            card.layer.cornerRadius = 5
            card.layer.masksToBounds = false
            card.layer.shadowPath = UIBezierPath(rect: card.bounds).cgPath
            card.layer.shadowColor = UIColor.black.cgColor
            card.layer.shadowOffset = CGSize(width: -2, height: 3)
            card.layer.shadowRadius = 2;
            card.layer.shadowOpacity = 0.5
        }
    }
    
    func updateCardData(_ newView: UIView){
        cards.append(newView)
        locations = cards.map{ (x:UIView) in x.frame }
        info = cards.map{ card in
            let data = card.accessibilityLabel
            let parts = data?.characters.split(separator: " ").map(String.init)
            return (parts![1], Int(parts![2])!, parts![3])
        }
        if arrowStates == [.off, .off, .off]{
            sort(by: 0, direction:"up")
        } else {
            for i in 0..<arrowStates.count{
                if arrowStates[i] != .off{
                    let d = arrowStates[i] == .up ? "up" : "down"
                    sort(by: i, direction: d)
                }
            }
        }
    }
    
    func updateCards(){
        locations = cards.map{ (x:UIView) in x.frame }
        info = cards.map{ card in
            let data = card.accessibilityLabel
            let parts = data?.characters.split(separator: " ").map(String.init)
            return (parts![1], Int(parts![2])!, parts![3])
        }
        if arrowStates == [.off, .off, .off]{
            sort(by: 0, direction:"up")
        } else {
            for i in 0..<arrowStates.count{
                if arrowStates[i] != .off{
                    let d = arrowStates[i] == .up ? "up" : "down"
                    sort(by: i, direction: d)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "WishlistPopover") {
            let popover = (segue.destination as! ModalViewController)
            popover.arrowStates = arrowStates
            popover.wishlist = self
        }
    }
    
    func initializeSwipes(){
        for (_,card) in cards.enumerated(){
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(WishListViewController.handleSwipe(gesture:)))
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRightOnOverwatch))
            swipeLeft.direction = .left
            swipeRight.direction = .right
            card.addGestureRecognizer(swipeLeft)
            card.addGestureRecognizer(swipeRight)
        }
    }
    
    func handleSwipe(gesture: UISwipeGestureRecognizer){
        let card = (gesture.view)!
        let frame = card.frame
        self.view.layoutSubviews()
        for constraint in self.view.constraints{
            if (constraint.firstAttribute == .trailing || constraint.secondAttribute == .trailing) && constraint.secondItem as! NSObject == card{
                constraint.constant = 100
                
                
                trash = UIButton(frame: CGRect(x:frame.origin.x + frame.width - 80,
                                               y: frame.origin.y + 20,
                                               width: 60,
                                               height: 60))
                trash?.addTarget(self, action: #selector(WishListViewController.removeCard(sender:)), for: .touchDown)
                trash!.setImage(#imageLiteral(resourceName: "trash"), for: .normal)
                cardToDelete = card
                self.view.addSubview(trash!)
            }
        }
    }
    
    func removeCard(sender: UIButton){
        cardToDelete?.isHidden = true
//        cards.remove(at: cards.index(of: cardToDelete!)!)
        sender.removeFromSuperview()
//        updateCards()
    }
    
    func swipeRightOnOverwatch(){
        let frame = overwatch.frame
        if canSwipeRight{
            overwatch.frame = CGRect(x: frame.origin.x + frame.height, y: frame.origin.y, width: frame.width, height: frame.height)
            canSwipeLeft = true
            canSwipeRight = false
            trash!.isHidden = true
        }
    }
    
    func hideOverwatch(){
        self.overwatch.isHidden = true
        trash?.isHidden = true
    }
    
    @IBAction func searchFinished(_ sender: UITextField) {
        if sender.text?.lowercased() == "minecraft"{
            minecraftPC.isHidden = false
            updateCardData(minecraftPC)
            roundedAndShadows()
            sender.resignFirstResponder()
        }
    }
    
    open func sort(by index:Int, direction:String){
        let inorder = info.sorted{
            let (name1, date1, platform1) = $0
            let (name2, date2, platform2) = $1
            switch(index){
            case 0:
                return direction == "up" ? name1 < name2 : name1 > name2
            case 1:
                return direction == "up" ? date1 < date2 : date1 > date2
            case 2:
                return direction == "up" ? platform1 < platform2 : platform1 > platform2
            default:
                return direction == "up" ? name1 < name2 : name1 > name2
            }
        }
        for i in 0..<inorder.count{
            for card in cards{
                if card.accessibilityLabel?.characters.split(separator: " ").map(String.init)[1] == inorder[i].0{
                    card.frame = locations[i]
                }
            }
        }
        roundedAndShadows()
    }
}
