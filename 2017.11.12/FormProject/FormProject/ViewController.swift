//
//  ViewController.swift
//  FormProject
//
//  Created by Benny Davidovitz on 12/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension String{
    var isValidEmail : Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func emailAction(_ sender: UITextField) {
        
        let email = sender.text ?? ""
        sender.textColor = email.isValidEmail ? .green : .red
        //let isValid = isValidEmail(testStr: sender.text ?? "")
        //sender.textColor = isValid ? .green : .red
        
    }
    

    @IBAction func tapAction(_ sender: Any) {
        
        self.view.endEditing(true)
        
    }
    
    @IBAction func didEndOnExitAction(_ sender: UITextField) {
        
        if let nextField = self.view.viewWithTag(sender.tag + 1) as? UITextField{
            nextField.becomeFirstResponder()
        } else {
            sender.resignFirstResponder()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

