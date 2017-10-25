//
//  PinchViewController.swift
//  GesturesProject
//
//  Created by hackeru on 25/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rotate = CGAffineTransform(rotationAngle: 0.25 * CGFloat.pi)
        self.view.viewWithTag(1)?.transform = rotate
    }
    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        guard let myView = sender.view else{
            return
        }
        //https://stackoverflow.com/questions/2690337/get-just-the-scaling-transformation-out-of-cgaffinetransform
        let scale = sender.scale
        //sender.view?.transform = CGAffineTransform(scaleX: scale, y: scale)
        myView.transform = myView.transform.scaledBy(x: scale, y: scale)
        sender.scale = 1.0
        
        if sender.state == .ended{
            UIView.animate(withDuration: 0.7 /*seconds*/, animations: {
                //myView.transform = .identity
                myView.transform = CGAffineTransform(rotationAngle: 0.25 * CGFloat.pi)
            })
        }
    }
    
    


}

















