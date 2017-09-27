//
//  Utils.swift
//  ProtocolorProject
//
//  Created by Benny Davidovitz on 27/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension UIColor{
    //computed property
    var redValue : CGFloat{
        get{
            return CIColor(color: self).red
        }
    }
    
    var greenValue : CGFloat{
        return CIColor(color: self).green
    }
    
    var blueValue : CGFloat { return CIColor(color: self).blue }
    
    var alphaValue : CGFloat{
        get{
            return CIColor(color: self).alpha
        }
    }
    
//    func redValue() -> CGFloat{
//        return CIColor(color: self).red
//    }
}


























