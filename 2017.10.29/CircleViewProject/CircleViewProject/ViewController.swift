//
//  ViewController.swift
//  CircleViewProject
//
//  Created by Benny Davidovitz on 29/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressView: ProgressView!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        progressView.progress = CGFloat(sender.value)
        
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

