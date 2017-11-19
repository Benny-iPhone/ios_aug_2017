//
//  ViewController.swift
//  Alerts
//
//  Created by Benny Davidovitz on 19/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import ReachabilitySwift

class ViewController: UIViewController {

    let r = Reachability()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        r.whenReachable = { _ in print("conneted")}
        r.whenUnreachable = { _ in
            
            print("not connected")
            
            let alert = UIAlertController(title: "Network Connection", message: "You are offline", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "okay", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { (_) in
                let url = URL(string: UIApplicationOpenSettingsURLString)!
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        try? r.startNotifier()
        
    }

    @IBAction func displayAlertAction(_ sender: Any) {

        let alert = UIAlertController(title: "Yo", message: "You pressed the button my friend", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "close", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let doSomethingAction = UIAlertAction(title: "Do Something", style: .default) { (_) in
            
            print("doing something")
            
        }
        
        alert.addAction(doSomethingAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    


}











