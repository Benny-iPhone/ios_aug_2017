//
//  DetailsViewController.swift
//  FuelStations
//
//  Created by Benny Davidovitz on 17/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var station : FuelStation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = station.name
    }

    @IBAction func wazeMeThereAction(){
        
        let lat = station.location.coordinate.latitude
        let lng = station.location.coordinate.longitude
        
        let wazeStr = "waze://?ll=\(lat),\(lng)&navigate=yes"
        let url = URL(string: wazeStr)!
        
        let app = UIApplication.shared
        
        if app.canOpenURL(url){
            app.open(url, options: [:], completionHandler: nil)
        }
        
    }
}










