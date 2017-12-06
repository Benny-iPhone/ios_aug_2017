//
//  DatabaseLogic.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 06/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Firebase

class DatabaseLogic{
    static let shared = DatabaseLogic()
    
    let usersRef : DatabaseReference
    
    private init(){
        let rootRef = Database.database().reference()
        usersRef = rootRef.child("users")
    }
    
    func write(user : User){
        
        let dict : [String:Any] = [
            "name":user.displayName ?? "no name",
            "email":user.email ?? "no email"
        ]
        
        usersRef.child(user.uid).setValue(dict)
    }
    
    func trackAllUsers(with callback : @escaping ([String:Any])->Void)
    {
        usersRef.observe(DataEventType.childAdded) { (snapshot) in
            
            guard let dict = snapshot.value as? [String:Any] else{
                return
            }
            
            callback(dict)
            
        }
    }
}











