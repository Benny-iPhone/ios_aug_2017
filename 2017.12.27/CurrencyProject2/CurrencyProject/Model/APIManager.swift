//
//  APIManager.swift
//  CurrencyProject
//
//  Created by Benny Davidovitz on 27/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    
    static let shared = APIManager()
    
    private let apiKey : String
    private let baseURL : String
    
    private init(){
        apiKey = "8tWmQuR7qRwhZUyyZdzQMCUZcucFODGW"//"I8gHPjY9BOTGImUw5XLHQgjC3eRxekwt"
        baseURL = "https://forex.1forge.com/1.0.2/"
    }
    
    typealias AvailableCurrenciesCallback = (_ currencies : [String]) -> Void
    
    func getAvailableCurrencies(with completion : @escaping AvailableCurrenciesCallback)
    {
        let url = baseURL + "symbols"
        
        let params : [String:Any] = [
            "api_key":apiKey
        ]
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (dataResponse) in
            
            guard let json = dataResponse.result.value as? [String] else{
                completion([])
                return
            }
            
            var set : Set<String> = []
            
            for pair in json{
                let index = pair.index(pair.startIndex, offsetBy: 3)
                let subString = pair[..<index]

                set.insert(String(subString))
            }
            
            completion(Array(set))
            
        }
        
    }
    
    typealias ConvertCallback = (_ rate : Double) -> Void
    
    func getConvertValue(from : String,
                         to : String,
                         completion : @escaping ConvertCallback)
    {
        
        let url = baseURL + "convert"
        
        let params : [String:Any] = [
            "api_key":apiKey,
            "from":from,
            "to":to,
            "quantity":1
        ]
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (dataResponse) in
            
            guard let json = dataResponse.result.value as? [String:Any],
                let value = json["value"] as? Double else{
                    
                    completion(0)
                    return
            }
            
            completion(value)
            
        }
        
    }
    
}
































