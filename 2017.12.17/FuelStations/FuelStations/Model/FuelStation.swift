//
//  FuelStation.swift
//  FuelStations
//
//  Created by Benny Davidovitz on 17/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class FuelStation: NSObject {
    let name : String?
    let vicinity : String?
    let location : CLLocation
    
    init?(_ dict : [String:Any]) {
        self.name = dict["name"] as? String
        self.vicinity = dict["vicinity"] as? String
        
        guard let geometry = dict["geometry"] as? [String:Any],
            let location = geometry["location"] as? [String:CLLocationDegrees] else{
                return nil
        }
        
        self.location = CLLocation(latitude: location["lat"]!,
                                   longitude: location["lng"]!)
        
        super.init()
    }
}

extension FuelStation : MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D{
        return location.coordinate
    }
    
    var title: String?{
        return name
    }
    
    var subtitle: String?{
        return vicinity
    }
}






















