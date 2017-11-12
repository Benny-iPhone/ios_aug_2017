//
//  ViewController.swift
//  TextFieldWithSave
//
//  Created by Benny Davidovitz on 12/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //open keyboard
        textField.becomeFirstResponder()
        
    }
    
    //click on return key
    @IBAction func textFieldDidEndOnExitAction(_ sender: UITextField) {
        //close keyboard
        textField.resignFirstResponder()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(textField.text, forKey: "str")
        //save now
        userDefaults.synchronize()
        
        textField.text = ""
        
    }
    
    @IBAction func readAction(_ sender: Any) {
        
        textField.text = UserDefaults.standard.string(forKey: "str")
        
    }
    

}











