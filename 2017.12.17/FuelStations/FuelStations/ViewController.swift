//
//  ViewController.swift
//  FuelStations
//
//  Created by Benny Davidovitz on 17/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func refreshPlacesAction(_ sender: Any) {
        //cleanup
        mapView.removeAnnotations(mapView.annotations)
        
        //load
        AppManager.manager.getNearbyFuelStations {
            self.mapView.addAnnotations($0)
        }
        
    }
    
    
    @IBAction func findAddressAction(_ sender: Any) {
        
        guard let location = AppManager.manager.currentLocation else{
            return
        }
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard let p = placemarks?.first else{
                return
            }
            
            var address : [String] = []
            
            if let name = p.name{
                address.append(name)
            }
            if let country = p.country{
                address.append(country)
            }
            if let city = p.locality{
                address.append(city)
            }
            if let street = p.thoroughfare {
                address.append(street)
            }
            if let number = p.subThoroughfare{
                address.append(number)
            }
            
            self.label.text = address.joined(separator: ",")
        }
        
        
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

