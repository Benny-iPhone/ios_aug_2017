//
//  ZipcodesViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 26/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ZipcodesViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    enum Component : Int{
        case states, zipcodes
        
        static let count = 2
    }
    
    let data : [String:[String]]
    let allStates : [String]
    var currentZipcodes : [String]
    
    required init?(coder aDecoder: NSCoder) {
        
        let path = Bundle.main.path(forResource: "statedictionary", ofType: "plist")!
        let rawDictionary = NSDictionary(contentsOfFile: path)!
        self.data = rawDictionary as! [String:[String]]
        self.allStates = Array(data.keys).sorted()
        self.currentZipcodes = data[allStates[0]]!
        
        super.init(coder: aDecoder)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Component.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let c = Component(rawValue: component) else{
            return 0
        }
        
        switch c {
        case .states:
            return allStates.count
        case .zipcodes:
            return currentZipcodes.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        guard let c = Component(rawValue: component) else{
            return nil
        }
        
        switch c {
        case .states:
            return allStates[row]
        case .zipcodes:
            return currentZipcodes[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        guard let c = Component(rawValue: component) else{
            return
        }
        
        guard c == .states else{
            return
        }
        
        let state = allStates[row]
        //refresh data
        self.currentZipcodes = data[state]!
        //refresh UI
        pickerView.reloadComponent(Component.zipcodes.rawValue)
    }
    
}


















