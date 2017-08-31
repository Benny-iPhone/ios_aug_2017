//
//  ViewController.swift
//  HelloWorld
//
//  Created by Benny Davidovitz on 30/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

        textField.text = nil
        label.text = ""
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
//        let text = textField.text == nil ? "" : textField.text!
        label.text = "hello " + (textField.text ?? "")
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

