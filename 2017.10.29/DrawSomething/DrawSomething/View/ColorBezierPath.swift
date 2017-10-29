//
//  ColorBezierPath.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 29/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ColorBezierPath: UIBezierPath {
    var strokeColor : UIColor?
    
    override func stroke() {
        strokeColor?.setStroke()
        
        super.stroke()
    }
}














