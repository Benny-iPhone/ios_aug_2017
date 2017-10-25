//
//  ViewController.swift
//  Spin
//
//  Created by hackeru on 25/10/2017.
//  Copyright © 2017 iosAgents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer : Timer?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func spinAction(_ sender: UIButton) {
        
        if timer != nil{
            //Stop
            timer?.invalidate()
            timer = nil
            sender.isSelected = false
            return
        }
        
        //Start
        sender.isSelected = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: { (t) in
            
            let transform = self.imageView.transform.rotated(by: CGFloat.pi * 0.005)
            self.imageView.transform = transform
            
        })
        

        
    }


}















