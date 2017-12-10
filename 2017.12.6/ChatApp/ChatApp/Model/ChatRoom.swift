//
//  ChatRoom.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 10/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation

class ChatRoom{
    let id : String
    let name : String
    let date : Date
    let owner : String
    
    init(key : String, dict : [String:Any]) {
        self.id = key
        
        self.name = dict["name"] as? String ?? "No Name"
        self.owner = dict["owner"] as? String ?? ""
        
        let timestamp = dict["date"] as? TimeInterval ?? 0
        self.date = Date(timeIntervalSince1970: timestamp)
    }
}
























