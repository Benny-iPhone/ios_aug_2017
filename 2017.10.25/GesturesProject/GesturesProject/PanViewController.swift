//
//  PanViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 22/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class PanViewController: UIViewController {

    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        
        sender.view?.center = sender.location(in: sender.view?.superview)
        
    }
}

















