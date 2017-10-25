//
//  RotationViewController.swift
//  GesturesProject
//
//  Created by hackeru on 25/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {
        
        guard let myView = sender.view else {
            return
        }
        
        let angle = sender.rotation
        //myView.transform = CGAffineTransform(rotationAngle: angle)
        
        myView.transform = myView.transform.rotated(by: angle)
        sender.rotation = 0
        
        if sender.state == .ended{
            UIView.animate(withDuration: 0.7, animations: {
                myView.transform = .identity
            })
        }
    }
    
    

}











