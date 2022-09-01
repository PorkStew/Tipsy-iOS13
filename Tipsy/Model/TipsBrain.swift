//
//  BMIBrain.swift
//  Tipsy
//
//  Created by Stewart Clay on 2022/09/01.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct TipsBrain{
    
    var billAmount: String?
    var tipPercentage: Float?
    var tipLabel: String!
    var splitBy: Int?
    
    
    mutating func getPercentageTip(selectedTip: String, zeroPctButton: UIButton, tenPcButton: UIButton, twentyPcButton: UIButton) {
        
        switch selectedTip {
        case "0%":
            zeroPctButton.isSelected = true
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = false
            tipPercentage = 0
            tipLabel = "0%"
        case "10%":
            tenPcButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPcButton.isSelected = false
            tipPercentage = 1.1
            tipLabel = "10%"
        case "20%":
            twentyPcButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPcButton.isSelected = false
            tipPercentage = 1.2
            tipLabel = "20%"
        default:
            print("Error")
        }
    }
    mutating func calculateTip(splitNumberLabel: UILabel, billAmount: Float!) {
        var total = billAmount! * tipPercentage!
        total = total / Float(splitNumberLabel.text!)!
        self.billAmount = String(format: "%.2f", total)
        tipPercentage = tipPercentage!
        splitBy = Int(splitNumberLabel.text!)
    }
}
