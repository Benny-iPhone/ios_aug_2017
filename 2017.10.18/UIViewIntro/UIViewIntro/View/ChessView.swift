//
//  ChessView.swift
//  UIViewIntro
//
//  Created by Benny Davidovitz on 18/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ChessView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createBoard()
    }
    
    //support for constraints
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clear()
        createBoard()
    }

    private func clear(){
        for sub in self.subviews{
            sub.removeFromSuperview()
        }
    }
    
    private func createBoard(){
        let tileSize = min(self.bounds.width, self.bounds.height) / 8
        
        var rect = CGRect(x: 0, y: 0, width: tileSize, height: tileSize)
        
        for i in 0..<8{
            for j in 0..<8{
                
                let tile = UIView(frame: rect)
                if (i + j) % 2 == 0{
                    tile.backgroundColor = .black
                } else {
                    tile.backgroundColor = .lightGray
                }
                
                self.addSubview(tile)
                
                rect.origin.x += tileSize
                
            }
            
            rect.origin.x = 0
            rect.origin.y += tileSize
        }
    }

}

















