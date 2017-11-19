//
//  ViewController.swift
//  StepperProject
//
//  Created by Benny Davidovitz on 19/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var iSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        print(path)
        
        stepperAction(stepper)
        
        let value = UserDefaults.standard.value(forKey: "sound") as? Bool ?? true
        print(value)
        iSwitch.isOn = value
        
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: "sound")
        userDefaults.synchronize()
        
    }
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        label.text = String(format: "%.0f",sender.value)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

