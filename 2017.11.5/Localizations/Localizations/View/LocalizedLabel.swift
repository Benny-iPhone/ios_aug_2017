//
//  LocalizedLabel.swift
//  Localizations
//
//  Created by Benny Davidovitz on 05/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class LocalizedLabel: UILabel {

    @IBInspectable var localizeKey : String?
    
    //like viewDidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let key = localizeKey{
            self.text = key.localized
        }
    }

}
















