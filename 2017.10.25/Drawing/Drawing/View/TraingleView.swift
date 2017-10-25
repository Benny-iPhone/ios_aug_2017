//
//  TalView.swift
//  Drawing
//
//  Created by hackeru on 25/10/2017.
//  Copyright © 2017 iosAgents. All rights reserved.
//

import UIKit

@IBDesignable class TraingleView: UIView {

    @IBInspectable var strokeSize : CGFloat = 1{
        didSet{
            //refresh draw
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var strokeColor : UIColor = .black{
        didSet{
            //refresh draw
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var fillColor : UIColor = .white{
        didSet{
            //refresh draw
            self.setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code

        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        
        let w = self.bounds.width
        let h = self.bounds.height
        
        context.move(to: CGPoint(x: w * 0.5, y: h * 0.1))
        context.addLine(to: CGPoint(x: w * 0.1, y: h * 0.9))
        context.addLine(to: CGPoint(x: w * 0.9, y: h * 0.9))
        
        context.closePath()
        
        //limit stroke size to 1...10
        context.setLineWidth(max(min(strokeSize,10),1))
        
        //context.setStrokeColor(UIColor.blue.cgColor)
        strokeColor.setStroke()
        fillColor.setFill()
        
        context.drawPath(using: .fillStroke)
        //context.strokePath()
        
        //context.drawPath(using: .stroke)
    }
    

}

















