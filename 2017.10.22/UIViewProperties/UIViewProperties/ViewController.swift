//
//  ViewController.swift
//  UIViewProperties
//
//  Created by Benny Davidovitz on 22/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var smallView: UIView!
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else{
            print("something is buggy...")
            return
        }
        
        imageView.isHighlighted = !imageView.isHighlighted
    }
    
    
    
    @IBAction func userInteractionAction(_ sender: UISwitch) {
        smallView.isUserInteractionEnabled = sender.isOn
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func alphaAction(_ sender: UISlider) {
        
        smallView.alpha = CGFloat(sender.value)
        
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        smallView.isHidden = !sender.isOn
        
    }
    
    @IBAction func fadeSwitchAction(_ sender: UISwitch) {
        //disable switch
        sender.isEnabled = false
        
        if sender.isOn {
            //display before animation
            smallView.isHidden = false
        }
        
        UIView.animate(withDuration: 0.7, animations: {
            //animation code
            self.smallView.alpha = sender.isOn ? 1 : 0
        }) { (completed) in
            //animation completed code
            if sender.isOn == false{
                //hide when animation finished
                self.smallView.isHidden = true
            }
            
            //re-enable switch
            sender.isEnabled = true
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageView = self.view.viewWithTag(8)
        imageView?.backgroundColor = .orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}














