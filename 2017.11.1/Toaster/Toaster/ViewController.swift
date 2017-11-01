//
//  ViewController.swift
//  Toaster
//
//  Created by Benny Davidovitz on 01/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        tapGesture.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(tapGesture)
        
    }

    
    @objc func tapAction(){
        "test str".toast()
        //self.view.showToast(with: "Make me a Toast 🍻")
        //ToastLabel.show(with: "Make me a Toast 🍻", on: self.view, duration: 2.5)
    }

}
















