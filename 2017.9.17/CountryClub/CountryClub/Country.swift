//
//  Country.swift
//  CountryClub
//
//  Created by Benny Davidovitz on 17/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class Country: NSObject {
    let name : String
    let code : String
    
    init(_ dict : [String:Any]) {
        name = dict["name"] as! String
        code = dict["code"] as! String
        
        super.init()
    }
    
    class func readFile() -> [Country]
    {
        //path for file
        guard let path = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            print("file countries.json not found")
            return []
        }
        //read data
        guard let data = try? Data(contentsOf: path) else{
            print("failed to open file")
            return []
        }
        
        //prase to json
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else{
            print("data is not a valid json")
            return []
        }
        
        //Array<Dictionary<String,Any>> === [[String:Any]]
        //parse to array of dictionaries
        guard let arr = json as? [[String:Any]] else{
            print("json is not in corrent format")
            return []
        }
        
        //prase to array of Country
        
        return arr.flatMap{ Country($0) }
        /*
        arr.flatMap { (d : [String : Any]) -> Country in
            return Country(d)
        }*/
        
        /*
        var finalArray : [Country] = []
        for dict in arr{
            let c = Country(dict)
            finalArray.append(c)
        }
        
        return finalArray*/
    }
}




















