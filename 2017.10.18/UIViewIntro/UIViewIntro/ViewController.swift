//
//  ViewController.swift
//  UIViewIntro
//
//  Created by Benny Davidovitz on 18/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let rect = CGRect(x: 100, y: 150, width: 100, height: 100)
        let myView = UIView(frame: rect)
        myView.backgroundColor = UIColor.cyan
        self.view.addSubview(myView)
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            myView.removeFromSuperview()
        }

        
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = #imageLiteral(resourceName: "image_bg")
        self.view.addSubview(imageView)
        
        self.view.sendSubview(toBack: imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}











