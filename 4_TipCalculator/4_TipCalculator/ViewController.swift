//
//  ViewController.swift
//  4_TipCalculator
//
//  Created by absin on 1/25/18.
//  Copyright © 2018 absin.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var bill: Float = 0.00
    var tipPercemt: Float = 25.00
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billTextField.delegate = self
        billTextField.keyboardType = .decimalPad
        let numberToolBar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        numberToolBar.barStyle = UIBarStyle.default
        numberToolBar.items = [UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.cancelNumberPad)), UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneWithNumberPad))]
        numberToolBar.sizeToFit()
        billTextField.inputAccessoryView = numberToolBar
        updateFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slide(_ sender: UISlider) {
        tipPercemt = 50*sender.value
        updateFields()
    }
    
    func updateFields() {
        let tipPercentInt = Int(tipPercemt)
        let tip = Float(tipPercemt/100*bill)
        let total = bill + tip
        tipPercentLabel.text = "Tip (\(String(tipPercentInt))%)"
        tipAmount.text = "$\(String(format: "%.2f", tip))"
        totalAmount.text = "$\(String(format: "%.2f", total))"
    }
    
    @objc func cancelNumberPad(_ sender: UIBarButtonItem) {
        billTextField.resignFirstResponder()
        billTextField.text = "$0.00"
    }
    @objc func doneWithNumberPad(_ sender: UIBarButtonItem) {
        billTextField.resignFirstResponder()
        guard let input = billTextField.text else {
            print("No number entered")
            return
        }
        bill = Float(input)!
        print("\(bill) is inputted bill")
        billTextField.text = "$" + String(format: "%.2f", bill)
        updateFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return pressed")
        textField.resignFirstResponder()
        var input = "0.00"
        input = billTextField.text!
        bill = Float(input)!
        print("\(bill) is your bill")
        billTextField.text =  "$" + String(format: "%.2f", bill)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        billTextField.text = ""
    }

}

