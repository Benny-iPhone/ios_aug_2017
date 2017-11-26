//
//  FirstViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 26/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePickerAction(datePicker)
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        //formatter.dateFormat = "dd/MM/yyyy HH:mm"
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.calendar = Calendar(identifier: .hebrew)
        formatter.locale = Locale(identifier: "he")
        
        label.text = formatter.string(from: sender.date)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}















