//
//  TapViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 22/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3) {
            self.myView.center = sender.location(in: self.view)
        }
        
    }
    
}



















