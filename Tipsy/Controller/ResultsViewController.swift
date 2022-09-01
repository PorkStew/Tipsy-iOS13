//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Stewart Clay on 2022/08/31.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billAmount: String?
    var tipPercentage: String?
    var splitBy: Int? = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(billAmount!)
        settingsLabel.text = "Split between \(splitBy!) people, with \(tipPercentage!) tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
