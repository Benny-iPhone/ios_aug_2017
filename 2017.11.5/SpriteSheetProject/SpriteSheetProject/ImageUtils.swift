//
//  ImageUtils.swift
//  SpriteSheetProject
//
//  Created by Benny Davidovitz on 05/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension UIImage{
    func cropRect(_ rect : CGRect) -> UIImage?
    {
        let cropRect = CGRect(
            x: rect.origin.x * self.scale,
            y: rect.origin.y * self.scale,
            width: rect.size.width * self.scale,
            height: rect.size.height * self.scale)
        
        guard let cgImage = self.cgImage?.cropping(to: cropRect) else{
            return nil
        }
        
        return UIImage(cgImage: cgImage)
        
    }
    
    func cropSpriteSheetImages(columns : UInt, rows : UInt) -> [UIImage]
    {
        let subImageSize = CGSize(
            width: self.size.width / CGFloat(columns),
            height: self.size.height / CGFloat(rows))
        
        var rect = CGRect(origin: CGPoint.zero, size: subImageSize)
        
        var arr : [UIImage] = []
        
        for _ in 0..<rows{
            
            for _ in 0..<columns{
                
                if let img = self.cropRect(rect){
                    arr.append(img)
                }
                
                rect.origin.x += subImageSize.width
                
            }
            
            rect.origin.x = 0
            rect.origin.y += subImageSize.height
            
        }
        
        return arr
    }
}

























