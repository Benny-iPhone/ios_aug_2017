//
//  ViewController.swift
//  DateConverter
//
//  Created by Benny Davidovitz on 10/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Mode : Int{
        case gregToHeb
        case hebToGreg
        case gregToArab
        
        var sourceCalendar : Calendar{
            get{
                switch self {
                case .gregToHeb, .gregToArab:
                    return Calendar(identifier: .gregorian)
                case .hebToGreg:
                    return Calendar(identifier: .hebrew)
                }
            }
        }
        
        var destCalendar : Calendar{
            get{
                switch self {
                case .gregToHeb: return Calendar(identifier: .hebrew)
                case .hebToGreg: return Calendar(identifier: .gregorian)
                case .gregToArab: return Calendar(identifier: .islamic)
                }
            }
        }
    }
    
    var mode : Mode = .gregToHeb{
        didSet{
            datePickerAction(datePicker)
            datePicker.calendar = mode.sourceCalendar
        }
    }

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
        formatter.calendar = mode.destCalendar
        //formatter.calendar = Calendar(identifier: .hebrew)
        formatter.locale = Locale(identifier: "he")
        
        dateLabel.text = formatter.string(from: sender.date)
        
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        if let m = Mode(rawValue: sender.selectedSegmentIndex){
            self.mode = m
        } else {
            print("unsupported index \(sender.selectedSegmentIndex)")
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





