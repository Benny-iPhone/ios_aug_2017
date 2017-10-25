//
//  ViewController.swift
//  Drawing
//
//  Created by hackeru on 25/10/2017.
//  Copyright © 2017 iosAgents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tView: TraingleView!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        tView.strokeSize = CGFloat(sender.value)
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

