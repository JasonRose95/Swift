//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

var tip = 0.10

var split = 2.0

var amount = 0.0

var finalResult = "0.0"

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
  
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        tip = buttonTitleAsANumber / 100
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = sender.value
        splitNumberLabel.text = String(format: "%.0f", split)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
            print(tip)
            print(split)
        let bill = billTextField.text!
       
        if bill != "" {
            amount = Double(bill)!
            let result = amount * (1 + tip) / Double(split)
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            finalResult = resultTo2DecimalPlaces
            }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
       
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = Int(split)
        }
    }
}

