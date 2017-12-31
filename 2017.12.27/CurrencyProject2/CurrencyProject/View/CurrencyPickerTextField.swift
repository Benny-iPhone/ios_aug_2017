//
//  CurrencyPickerTextField.swift
//  CurrencyProject
//
//  Created by Benny Davidovitz on 27/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class CurrencyPickerTextField: UITextField , UIPickerViewDataSource, UIPickerViewDelegate{

    var pickerArray : [String] = []{
        didSet{
            (inputView as? UIPickerView)?.reloadAllComponents()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        pickerView.dataSource = self
        pickerView.delegate = self
        
        self.inputView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = pickerArray[row]
        
        self.sendActions(for: .valueChanged)
    }
}














