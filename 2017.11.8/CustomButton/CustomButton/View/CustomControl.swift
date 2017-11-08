//
//  CustomControl.swift
//  CustomButton
//
//  Created by Benny Davidovitz on 08/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    private func makeHighligh(_ h : Bool){
        for item in subviews{
            item.alpha = h ? 0.6 : 1
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        makeHighligh(true)
        return super.beginTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        makeHighligh(false)
        super.cancelTracking(with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        makeHighligh(false)
        super.endTracking(touch, with: event)
    }

}














