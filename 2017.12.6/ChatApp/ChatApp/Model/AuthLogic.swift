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
    
    var currentUserId : String?{
        return Auth.auth().currentUser?.uid
    }
    
    var currentUserName : String?{
        return Auth.auth().currentUser?.displayName
    }
    
    func setupRootViewController(){
        let window = UIApplication.shared.delegate?.window
        
        if self.didLogin{
            window??.rootViewController = UIStoryboard(name: "MainFlow", bundle: nil).instantiateInitialViewController()
        } else {
            window??.rootViewController = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
        }
    }
    
    
    func logout(){
        try? Auth.auth().signOut()
        setupRootViewController()
    }
    
    func facebookLogin(with token : String,
                       callback : @escaping (Error?)->Void)
    {
        
        let credential = FacebookAuthProvider.credential(withAccessToken: token)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            
            if let user = user{
                DatabaseLogic.shared.write(user: user)
            }
            
            callback(error)
            
            if error == nil{
                self.setupRootViewController()
            }
            
        }
        
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
            
            if error == nil{
                self.setupRootViewController()
            }
            
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
                
                if error == nil{
                    self.setupRootViewController()
                }
            })
            
            
            
        }
        
    }
}













