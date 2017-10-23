//
//  ViewController.swift
//  UIViewSubclass
//
//  Created by Benny Davidovitz on 22/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cView = CustomView(frame: CGRect(x: 30, y: 130, width: 100, height: 100))
        self.view.addSubview(cView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}












