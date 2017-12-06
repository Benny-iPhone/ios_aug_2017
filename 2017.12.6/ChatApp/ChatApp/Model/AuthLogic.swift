//
//  AuthLogic.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 06/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Firebase

class AuthLogic{
    static let shared = AuthLogic()
    
    var didLogin : Bool{
        return Auth.auth().currentUser != nil
    }
    
    func logout(){
        try? Auth.auth().signOut()
    }
    
    func forgotPassword(with email : String,
                        callback : @escaping (Error?)->Void)
    {
        Auth.auth().sendPasswordReset(withEmail: email, completion: callback)
    }
    
    func loginWith(email : String,
                   password : String,
                   callback : @escaping (Error?)->Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            callback(error)
            
        }
        
        
    }
    
    func registerWith(email : String,
                      password : String,
                      name : String,
                      image : UIImage?,
                      callback : @escaping (Error?)->Void)
    {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            //TODO:
            // update name
            // upload and update image
            // setup in database
            
            guard let user = user else{
                callback(error)
                return
            }
            
            let request = user.createProfileChangeRequest()
            request.displayName = name
            
            request.commitChanges(completion: { (err) in
                
                DatabaseLogic.shared.write(user: user)
                
                callback(err)
            })
            
            
            
        }
        
    }
}













