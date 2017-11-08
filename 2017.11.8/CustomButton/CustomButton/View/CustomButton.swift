//
//  CustomButton.swift
//  CustomButton
//
//  Created by Benny Davidovitz on 08/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

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
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 48)
        titleLabel?.numberOfLines = 2
        //titleLabel?.adjustsFontSizeToFitWidth = true
        
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = UIColor.black
        
        layer.cornerRadius = 12
        
        self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
    }
    
    override var intrinsicContentSize: CGSize{
        get{
            var size = super.intrinsicContentSize
            let labelSize = titleLabel!.intrinsicContentSize
            
            size.width = max(size.width, labelSize.width + 16)
            size.height = max(size.height, labelSize.height + 16)
            
            return size
            
        }
    }


}







