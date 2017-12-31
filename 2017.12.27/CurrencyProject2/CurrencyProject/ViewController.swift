//
//  ViewController.swift
//  CurrencyProject
//
//  Created by Benny Davidovitz on 27/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var quantityTextField: UITextField!
    
    @IBOutlet weak var toTextField: CurrencyPickerTextField!
    @IBOutlet weak var fromTextField: CurrencyPickerTextField!
    
    var currenciesArray : [String] = []{
        didSet{
            toTextField.pickerArray = currenciesArray
            fromTextField.pickerArray = currenciesArray
        }
    }
    var rate : Double = 0{
        didSet{
            self.quantityEditingChanged(quantityTextField)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        APIManager.shared.getAvailableCurrencies { (arr) in
            self.currenciesArray = arr
            
        }
        
        
        
        
    }
    
    @IBAction func quantityEditingChanged(_ sender: UITextField) {
        guard let text = sender.text, let quantity = Double(text) else{
            return
        }
        
        let value = quantity * rate
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = toTextField.text
        
        valueLabel.text = formatter.string(from: value as NSNumber)
    }
    
    @IBAction func pickerValueChanged(_ sender: Any) {
        
        guard let fromStr = fromTextField.text, !fromStr.isEmpty,
            let toStr = toTextField.text, !toStr.isEmpty else{
                return
        }
        
        APIManager.shared.getConvertValue(from: fromStr, to: toStr) { (rate) in
            self.rate = rate
        }
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}









