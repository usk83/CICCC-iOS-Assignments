//
//  ViewController.swift
//  TipCalculator
//
//  Created by Yusuke on 2020/04/29.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipPercentageTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculateTip() {
        guard let amountText = billAmountTextField.text, let amount = Float(amountText) else { return }
        guard let tipText = tipPercentageTextField.text, let tip = Float(tipText) else { return }
        tipAmountLabel.text = "$ \(String(format: "%.2f", amount * tip / 100))"
    }
}
