//
//  ViewController.swift
//  DateConverter
//
//  Created by Benny Davidovitz on 10/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //direct invoke the action , by sending the outleted object as an argument
        datePickerAction(datePicker)
        
        //or,
        //make it behave like value changed
        datePicker.sendActions(for: .valueChanged)
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        //dateLabel.text = sender.date.description
        
        let formatter = DateFormatter()
        
        formatter.dateStyle = .full
        formatter.calendar = Calendar(identifier: .hebrew)
        formatter.locale = Locale(identifier: "he")
        
        dateLabel.text = formatter.string(from: sender.date)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

