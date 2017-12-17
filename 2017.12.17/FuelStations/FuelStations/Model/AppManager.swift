//
//  AppManager.swift
//  FuelStations
//
//  Created by Benny Davidovitz on 17/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

extension Notification.Name{
    static var locationUpdated : Notification.Name{
        return Notification.Name(rawValue: "appmanager_location_updated_notification")
    }
}

class AppManager : NSObject, CLLocationManagerDelegate{
    static let manager = AppManager()
    
    private let locationManager : CLLocationManager
    
    var currentLocation : CLLocation?{
        return locationManager.location
    }
    
    func getNearbyFuelStations(with completion : @escaping ([FuelStation])->Void)
    {
        guard let location = currentLocation else{
            completion([])
            return
        }
        
        let baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        
        let params : [String:Any] = [
            "key":"AIzaSyCRdt-RRZUfxfCUn3tg-MdoSlyJp4aL060",
            "location":"\(location.coordinate.latitude),\(location.coordinate.longitude)",
            "radius":20_000,
            "type":"gas_station",
            "rankBy":"distance"
        ]
        
        Alamofire.request(baseUrl, method: .get, parameters: params).responseJSON { (dataResponse) in
            guard let value = dataResponse.value as? [String:Any],
                let results = value["results"] as? [[String:Any]] else{
                    completion([])
                    return
            }
            
            let arr : [FuelStation] = results.flatMap{FuelStation($0)}
            completion(arr)
        }
    }
    
    private override init(){
        locationManager = CLLocationManager()

        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50 //meter //kCLDistanceFilterNone
        
        locationManager.delegate = self
        
    }
    
    func startFindingLocation(){
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            return
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        startFindingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        
        NotificationCenter.default.post(name: .locationUpdated, object: self)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}














