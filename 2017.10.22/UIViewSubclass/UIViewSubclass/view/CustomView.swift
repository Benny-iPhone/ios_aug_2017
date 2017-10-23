//
//  CustomView.swift
//  UIViewSubclass
//
//  Created by Benny Davidovitz on 22/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension UIView{
    
    @IBInspectable var cornerRadius : CGFloat{
        set{
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
    
}

@IBDesignable class CustomView: UIView {

    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        
        //self.cornerRadius = 12
        //self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
    }
}
























