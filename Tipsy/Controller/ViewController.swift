//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipsBrain = TipsBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let selected = sender.currentTitle!
        tipsBrain.getPercentageTip(selectedTip: selected, zeroPctButton: zeroPctButton, tenPcButton: tenPcButton, twentyPcButton: twentyPcButton)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount = Float(billTextField.text!.replacingOccurrences(of: ",", with: "."))
        tipsBrain.calculateTip(splitNumberLabel: splitNumberLabel, billAmount: billAmount!)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billAmount = tipsBrain.billAmount
            destinationVC.splitBy = Int(splitNumberLabel.text!)
            destinationVC.tipPercentage = tipsBrain.tipLabel
        }
    }
}

