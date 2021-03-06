//
//  ViewController.swift
//  TipCalculator
//
//  Created by Yusuke on 2020/04/29.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var amount: Float?
    var tipPercentage: Float!

    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var tipPercentageSlider: UISlider!
    @IBOutlet var tipPercentageLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        amountTextField.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)

        tipPercentage = tipPercentageSlider.value
        updateUI()
    }

    @objc func dissmissKeyboard(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0 {
                view.frame.origin.y += keyboardSize.height / 2
            }
        }
    }

    func updateUI() {
        tipPercentageLabel.text = "\(String(format: "%.0f", tipPercentage)) %"
        if let amount = amount {
            tipAmountLabel.text = "$ \(String(format: "%.2f", amount * tipPercentage / 100))"
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func updateAmount(_ sender: UITextField) {
        guard let amountText = sender.text else {
            amount = nil
            return
        }
        amount = Float(amountText)
        updateUI()
    }
    
    @IBAction func updateTipPercentage(_ sender: UISlider) {
        tipPercentage = round(sender.value)
        sender.value = tipPercentage
        updateUI()
    }
}
