//
//  Utils.swift
//  PhoneValidator
//
//  Created by Benny Davidovitz on 01/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import libPhoneNumber_iOS

extension String{
    var isValidPhone : Bool{
        get{
            let phoneUtil = NBPhoneNumberUtil()
            guard let phone = try? phoneUtil.parse(self, defaultRegion: "IL") else{
                return false
            }
            
            return phoneUtil.isValidNumber(phone)
        }
    }
}
