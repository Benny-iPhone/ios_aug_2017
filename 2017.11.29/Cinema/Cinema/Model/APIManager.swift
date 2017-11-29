//
//  APIManager.swift
//  Cinema
//
//  Created by Benny Davidovitz on 29/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    
    static let manager = APIManager()
    
    private let apiKey : String
    private let baseUrl : String
    
    private init(){
        apiKey = "e898f9a386bfdb67610421b879360e02"
        baseUrl = "https://api.themoviedb.org/3/"
    }
    
    enum Endpoint : String{
        case nowPlaying = "movie/now_playing"
    }
    
    func getMovies(using endpoint : Endpoint, page : Int, callback : @escaping ([Movie])->Void)
    {
        let url = baseUrl + endpoint.rawValue
        let params : [String:Any] = [
            "api_key":self.apiKey,
            "page":page,
            "language":Locale.current.languageCode ?? "en"
        ]
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) in
            
            //handle json response
            guard let json = response.result.value as? [String:Any] else{
                callback([])
                print(response.result.error?.localizedDescription ?? "unknown error")
                return
            }
            
            //no error, lets parse data
            let results = json["results"] as? [[String:Any]] ?? []
            //parse to array of Movie
            let arr : [Movie] = results.flatMap{Movie($0)}
            callback(arr)
            
        }
    }
    
    
    
}















