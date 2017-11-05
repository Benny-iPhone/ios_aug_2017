//
//  Utils.swift
//  Localizations
//
//  Created by Benny Davidovitz on 05/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation

extension String{
    var localized : String{
        return Bundle.main.localizedString(forKey: self, value: self, table: nil)
    }
}
