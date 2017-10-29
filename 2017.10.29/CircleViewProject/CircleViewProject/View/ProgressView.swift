//
//  ProgressView.swift
//  CircleViewProject
//
//  Created by Benny Davidovitz on 29/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

@IBDesignable class ProgressView: UIView {

    @IBInspectable var progress : CGFloat = 75{ /*0...100*/
        didSet{
            //re-draw
            setNeedsDisplay()
        }
    }
    @IBInspectable var borderWidth : CGFloat = 2
    @IBInspectable var borderColor : UIColor = UIColor(rgb: 0x007AFF)
    @IBInspectable var fillColor : UIColor = .clear
    @IBInspectable var textColor : UIColor = UIColor(rgb: 0x8786AD)
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        
        let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius : CGFloat = min(bounds.width, bounds.height) * 0.5 - borderWidth * 0.5
        
        UIColor.darkGray.withAlphaComponent(0.7).setStroke()
        
        context.setLineWidth(borderWidth)
        
        context.addArc(center: centerPoint, radius: radius, startAngle: CGFloat.pi * 0.5, endAngle: CGFloat.pi * 2.5, clockwise: false)
        
        context.strokePath()
        
        let startAngle = CGFloat.pi * 0.5
        let endAngle = ((CGFloat.pi * 2) / 100) * progress + startAngle
        
        context.addArc(center: centerPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        
        borderColor.setStroke()
        fillColor.setFill()
        
        context.drawPath(using: .fillStroke)
        
        let text = String(format: "%.1f %%",progress)
        let textString : NSString = text as NSString
        
        let atts : [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: radius * 0.38),
            NSAttributedStringKey.foregroundColor: textColor
        ]
        
        let textSize : CGSize = textString.size(withAttributes: atts)
        let textRect = CGRect(x: bounds.midX - textSize.width/2,
                              y: bounds.midY - textSize.height/2,
                              width: textSize.width,
                              height: textSize.height)
        
        textString.draw(in: textRect, withAttributes: atts)
    }

}








