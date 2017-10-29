//
//  CircleView.swift
//  CircleViewProject
//
//  Created by Benny Davidovitz on 29/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class CircleView: UIView {

    
    var borderWidth : CGFloat = 20
    var borderColor : UIColor = .black
    var fillColor : UIColor = .purple
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        
        let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius : CGFloat = min(bounds.width, bounds.height) * 0.5 - borderWidth * 0.5
        
        context.addArc(center: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        context.setLineWidth(borderWidth)
        borderColor.setStroke()
        fillColor.setFill()
        
        context.drawPath(using: .fillStroke)
        
        let text = "98.8%"
        let textString : NSString = text as NSString
        
        let atts : [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: radius * 0.5),
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        
        let textSize : CGSize = textString.size(withAttributes: atts)
        let textRect = CGRect(x: bounds.midX - textSize.width/2,
                              y: bounds.midY - textSize.height/2,
                              width: textSize.width,
                              height: textSize.height)
        
        textString.draw(in: textRect, withAttributes: atts)
    }
 

}














