//
//  StatisticsViewController.swift
//  HCIProject4
//
//  Created by Humad Syed on 12/15/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var chartImage: UIImageView!
    @IBOutlet weak var calendarImage: UIImageView!
    @IBOutlet weak var lineChartButton: UIButton!
    @IBOutlet weak var pieChartButton: UIButton!
    @IBOutlet weak var timeSpentButton: UIButton!
    @IBOutlet weak var moneySpentButton: UIButton!
    
    
    var line = true
    
    var time = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartImage.image = UIImage(named: "line_chart_time")
        calendarImage.image = UIImage(named: "calendar")
        lineChartButton.isSelected = true
        timeSpentButton.isSelected = true
    }
    
    
    
    @IBAction func presentLineChart() {
        line = true
        lineChartButton.isSelected = true
        pieChartButton.isSelected = false
        
        if (time) {
            chartImage.image = UIImage(named: "line_chart_time")
        } else {
            chartImage.image = UIImage(named: "line_chart_money")
        }
        
        
        
    }
    
    @IBAction func presentPieChart() {
        line = false
        lineChartButton.isSelected = false
        pieChartButton.isSelected = true
        
        if (time) {
            chartImage.image = UIImage(named: "pie_chart_time")
        } else {
            chartImage.image = UIImage(named: "pie_chart_money")
        }
        
    }
    
    @IBAction func presentTimeSpent() {
        time = true
        timeSpentButton.isSelected = true
        moneySpentButton.isSelected = false
        
        if (line) {
            chartImage.image = UIImage(named: "line_chart_time")
        } else {
            chartImage.image = UIImage(named: "pie_chart_time")
        }
    }
    
    @IBAction func presentMoneySpent() {
        time = false
        timeSpentButton.isSelected = false
        moneySpentButton.isSelected = true
        
        if (line) {
            chartImage.image = UIImage(named: "line_chart_money")
        } else {
            chartImage.image = UIImage(named: "pie_chart_money")
        }
    }

}
