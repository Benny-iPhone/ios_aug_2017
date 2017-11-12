//
//  DateTextField.swift
//  FormProject
//
//  Created by Benny Davidovitz on 12/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class DateTextField: ToolbarTextField {

    var selectedDate : Date?{
        return (inputView as? UIDatePicker)?.date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createDatePicker()
    }
    
    override func becomeFirstResponder() -> Bool {
        
        if let datePicker = self.inputView as? UIDatePicker{
            datePicker.sendActions(for: .valueChanged)
        }
        
        return super.becomeFirstResponder()
    }
    
    private func createDatePicker(){
        let datePicker = UIDatePicker()
        
        datePicker.maximumDate = Date()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        
        datePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
        
        self.inputView = datePicker
        
    }
    
    @objc func datePickerAction(_ sender : UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.doesRelativeDateFormatting = true
        
        self.text = formatter.string(from: sender.date)
    }
    

}















