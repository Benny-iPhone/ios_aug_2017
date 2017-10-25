//
//  ViewController.swift
//  LongPressWithRandomColor
//
//  Created by hackeru on 25/10/2017.
//  Copyright © 2017 iosAgents. All rights reserved.
//

import UIKit

extension UIColor{
    class var random : UIColor{
        get{
            let redVal = CGFloat(arc4random_uniform(256)) / 255
            let blueVal = CGFloat(arc4random_uniform(256)) / 255
            let greenVal = CGFloat(arc4random_uniform(256)) / 255

            return UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 1)
        }
    }
}

class ViewController: UIViewController {

    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        
        guard sender.state == .began else{
            return
        }
 
        sender.view?.backgroundColor = .random
        /*
        if sender.view?.backgroundColor == .black{
            sender.view?.backgroundColor = .blue
        } else {
            sender.view?.backgroundColor = .black
        }
        */
    }
    

}












