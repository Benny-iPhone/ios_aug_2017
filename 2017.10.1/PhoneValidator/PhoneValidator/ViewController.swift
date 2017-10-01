//
//  ViewController.swift
//  PhoneValidator
//
//  Created by Benny Davidovitz on 01/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func editingChangedAction(_ sender: UITextField) {
        guard let text = sender.text, !text.isEmpty else {
            return
        }
        
        sender.textColor = text.isValidPhone ? .blue : .red
        
    }


}














