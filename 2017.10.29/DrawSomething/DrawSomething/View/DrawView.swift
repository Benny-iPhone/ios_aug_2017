//
//  DrawView.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 29/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class DrawView: UIView {

    private var beziers : [UIBezierPath] = []
    private var trash : [UIBezierPath] = []
    
    var strokeWidth : CGFloat = 1
    var strokeColor : UIColor = .black
    
    func clear(){
        beziers = []
        trash = []
        
        //refresh draw
        self.setNeedsDisplay()
        
    }
    
    func undo(){
        if let b = beziers.popLast(){
            trash.append(b)
        }
        
        //refresh draw
        self.setNeedsDisplay()
    }
    
    func redo(){
        if let b = trash.popLast(){
            beziers.append(b)
        }
        
        //refresh draw
        self.setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isMultipleTouchEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let t = touches.first else{
            return
        }
        
        let point = t.location(in: self)
        
        let b = ColorBezierPath()
        b.lineWidth = strokeWidth
        b.strokeColor = strokeColor
        b.move(to: point)
        
        self.beziers.append(b)
        
        trash = []
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let t = touches.first else{
            return
        }
        
        let point = t.location(in: self)
        
        beziers.last?.addLine(to: point)
        //refresh draw
        self.setNeedsDisplay()
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        for b in beziers{
            b.stroke()
        }
    }
 

}



















