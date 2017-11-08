//
//  ViewController.swift
//  ButtonProject
//
//  Created by Benny Davidovitz on 08/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var radioButtons: [UIButton]!
    
    @IBAction func radioButtonAction(_ sender: UIButton) {
        
        if sender.isSelected{
            return
        }
        
        for b in radioButtons{
            if b == sender{
                sender.isSelected = true
                sender.isUserInteractionEnabled = false
            } else {
                b.isSelected = false
                b.isUserInteractionEnabled = true
            }
        }
        
    }
    
    
    @IBAction func checkboxAction(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

