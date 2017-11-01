//
//  CustomLabel.swift
//  LabelProject
//
//  Created by Benny Davidovitz on 01/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    var insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    override var intrinsicContentSize: CGSize{
        get{
            var size = super.intrinsicContentSize
            size.width += insets.left + insets.right
            size.height += insets.top + insets.bottom
            
            return size
        }
    }
    
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
        textColor = .white
        backgroundColor = .black
        //font = UIFont.boldSystemFont(ofSize: 24)
        self.font = UIFont(name: "SairaSemiCondensed-Thin", size: 24)
        textAlignment = NSTextAlignment.center
        numberOfLines = 2
        
        layer.borderWidth = 2
        layer.borderColor = textColor.cgColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
    }


}




















