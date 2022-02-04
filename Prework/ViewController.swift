//
//  ViewController.swift
//  Prework
//
//  Created by slmrc on 2/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var SplitControl: UIStepper!
    @IBOutlet weak var SplitCount: UILabel!
    @IBOutlet weak var SplitTotal: UILabel!
    var count = 0
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        
        stepper.value = 1
        
        return stepper
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setSplit(_ sender: UIStepper) {
        
        SplitCount.text = String(sender.value)
        count = Int(Double(sender.value))
    }
 
    @IBAction func calculateTip(_ sender: Any) {
        
        var splitBill: Double
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        //Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        if (count != 0){
            splitBill = total/Double(count)
        }else{
            splitBill = 0
        }
        //Update Tip Amount Label

        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update total amount
        totalLabel.text = String(format: "$%.2f", total)
        SplitTotal.text = String(format: "$%.2f", splitBill)
    }
    
}

