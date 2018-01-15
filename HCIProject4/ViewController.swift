//
//  ViewController.swift
//  HCIProject4
//
//  Created by RAISE on 11/29/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Navbar: UINavigationItem!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var menuView: UIView!
    var isMenuOpen = false;
    
    var currentViewController: UIViewController!
    var inWishList = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.layer.shadowOpacity = 1
        loadHome()
    }
    
    func loadHome() {
        let homeViewController = self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController")
        
        self.addChildViewController(homeViewController)
        homeViewController.view.frame = mainView.bounds
        mainView.addSubview(homeViewController.view)
        homeViewController.didMove(toParentViewController: self)
        
        currentViewController = homeViewController
    }
    
    func removePreviousVC() {
        currentViewController.willMove(toParentViewController: nil)
        currentViewController.view.removeFromSuperview()
        currentViewController.removeFromParentViewController()
    }
    
    @IBAction func presentHome(_ sender: Any) {
        removePreviousVC()
        loadHome()
        Navbar.title = "Home"
        openCloseMenu()
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        if inWishList{
            self.currentViewController.view.viewWithTag(1234)?.becomeFirstResponder()
        }
    }
    
    @IBAction func presentWishList(_ sender: Any) {
        removePreviousVC()
        
        let wishListViewController = self.storyboard!.instantiateViewController(withIdentifier: "WishListViewController")
        
        self.addChildViewController(wishListViewController)
        wishListViewController.view.frame = mainView.bounds
        mainView.addSubview(wishListViewController.view)
        wishListViewController.didMove(toParentViewController: self)
        
        currentViewController = wishListViewController
        
        openCloseMenu()
        
        Navbar.title = "Wish List"
        inWishList = true
    }
    
    @IBAction func presentStatistics(_ sender: Any) {
        removePreviousVC()
        
         
        let statisticsViewController = self.storyboard!.instantiateViewController(withIdentifier: "StatisticsViewController")
        
        self.addChildViewController(statisticsViewController)
        statisticsViewController.view.frame = mainView.bounds
        mainView.addSubview(statisticsViewController.view)
        statisticsViewController.didMove(toParentViewController: self)
        
        currentViewController = statisticsViewController
 
        
        Navbar.title = "Statistics"
        
        openCloseMenu()
    }
    
    @IBAction func presentImport(_ sender: Any) {
        removePreviousVC()
        
        
         let importViewController = UIStoryboard(name: "Import", bundle: nil).instantiateViewController(withIdentifier: "something")
         
         self.addChildViewController(importViewController)
         importViewController.view.frame = mainView.bounds
         mainView.addSubview(importViewController.view)
         importViewController.didMove(toParentViewController: self)
         
         currentViewController = importViewController
        
        Navbar.title = "Import"
        
        openCloseMenu()
    }
    
    
    
    func openCloseMenu() {
        if (isMenuOpen) {
            leadingConstraint.constant = -250
            trailingConstraint.constant = -18
        } else {
            leadingConstraint.constant = 0;
            trailingConstraint.constant = -250
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        
        isMenuOpen = !isMenuOpen
    }
    
    @IBAction func openMenu(_ sender: Any) {
        openCloseMenu()
    }
}

