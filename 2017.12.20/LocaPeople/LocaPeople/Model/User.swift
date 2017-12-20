//
//  User.swift
//  LocaPeople
//
//  Created by Benny Davidovitz on 20/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation

class User{
    
    enum Gender : String{
        case female = "female"
        case male = "male"
    }
    
    struct Name {
        let title : String
        let first : String
        let last : String
        
        init(_ dict : [String:String]){
            self.title = dict["title"] ?? ""
            self.first = dict["first"] ?? ""
            self.last = dict["last"] ?? ""
        }
    }
    
    struct Picture {
        let large : URL?
        let medium : URL?
        let thumbnail : URL?
        
        init(_ dict : [String:String]) {
            self.large = URL(string: dict["large"] ?? "")
            self.medium = URL(string: dict["medium"] ?? "")
            self.thumbnail = URL(string: dict["thumbnail"] ?? "")
        }
    }
    
    let gender : Gender
    let name : Name
    let email : String
    let dateOfBirth : Date
    let picture : Picture
    
    init?(_ dict : [String:Any])
    {
        //gender
        guard let genderStr = dict["gender"] as? String,
            let gender = Gender(rawValue: genderStr) else{
                debugPrint("did not find valid value for key gender")
                return nil
        }
        
        self.gender = gender
        
        //name
        guard let nameDict = dict["name"] as? [String:String] else{
            return nil
        }
        
        self.name = Name(nameDict)
        
        //email
        guard let email = dict["email"] as? String else{
            return nil
        }
        
        self.email = email
        
        //date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let dateStr = dict["dob"] as? String,
            let date = formatter.date(from: dateStr) else{
                return nil
        }
        
        self.dateOfBirth = date
        
        //picture
        
        guard let pictureDict = dict["picture"] as? [String:String] else{
            return nil
        }
        
        self.picture = Picture(pictureDict)
    }
}















