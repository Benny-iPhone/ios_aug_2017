//
//  ViewController.swift
//  EmailValidation
//
//  Created by Benny Davidovitz on 27/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension String{
    var isValidEmail : Bool{
        get{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func textFieldEditingChangedAction(_ sender: UITextField) {
        
        guard let emailStr = sender.text else{
            imageView.isHighlighted = false
            return
        }
        
        //imageView.isHighlighted = emailStr.isValidEmail
        
        imageView.image = emailStr.isValidEmail ? #imageLiteral(resourceName: "checked") : #imageLiteral(resourceName: "un_checked")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}







