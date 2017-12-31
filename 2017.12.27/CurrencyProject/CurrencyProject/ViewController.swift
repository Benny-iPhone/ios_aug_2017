//
//  ViewController.swift
//  CurrencyProject
//
//  Created by Benny Davidovitz on 27/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var fromPickerView: UIPickerView!
    @IBOutlet weak var toPickerView: UIPickerView!
    
    var currenciesArray : [String] = []{
        didSet{
            self.fromPickerView.reloadAllComponents()
            self.toPickerView.reloadAllComponents()
            
            if !currenciesArray.isEmpty{
                self.pickerView(self.toPickerView, didSelectRow: 0, inComponent: 0)
            }

        }
    }
    
    var rate : Double = 0{
        didSet{
            //behave like text changed
            qunatityEditingChangedAction(quantityTextField)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromPickerView.dataSource = self
        fromPickerView.delegate = self

        toPickerView.dataSource = self
        toPickerView.delegate = self

        APIManager.shared.getAvailableCurrencies { (arr) in
            self.currenciesArray = arr
            

        }
        
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currenciesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currenciesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //reload rate value
        let fromSelectedRow = fromPickerView.selectedRow(inComponent: 0)
        let toSelectedRow = toPickerView.selectedRow(inComponent: 0)
        
        let fromStr = currenciesArray[fromSelectedRow]
        let toStr = currenciesArray[toSelectedRow]
        
        APIManager.shared.getConvertValue(from: fromStr, to: toStr) { (rate) in
            self.rate = rate
            
        }
        
    }
    
    @IBAction func qunatityEditingChangedAction(_ sender: UITextField) {
        //use rate to update label
        guard let text = sender.text,
            let quantity = Double(text) else{
                return
        }
        
        let value = rate * quantity
        valueLabel.text = String(format: "%.3f", value) //1.123
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}









