//
//  APIManager.swift
//  LocaPeople
//
//  Created by Benny Davidovitz on 20/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    
    static let manager = APIManager()
    
    private let baseUrl = "https://randomuser.me/api"
    
    private init(){
        
    }
    
    func getUsers(with completion : @escaping ([User]?,Error?)->Void)
    {
        let params : [String:Any] = [
            "results":30
        ]
        
        Alamofire.request(baseUrl, method: .get, parameters: params).responseJSON { (resData) in
            //validate that server returned json object
            guard let json = resData.result.value as? [String:Any] else{
                completion(nil, resData.result.error)
                return
            }
            
            //make sure its not an error... 💩
            if let errorStr = json["error"] as? String{
                let err = NSError(domain: "randomuser", code: 500, userInfo: [NSLocalizedDescriptionKey:errorStr]) as Error
                completion(nil,err)
                return
            }
            
            //handle data 😀
            
            let results = json["results"] as? [[String:Any]] ?? []
            let users : [User] = results.flatMap { User($0) }
            completion(users,nil)
            
        }
    }
}





















