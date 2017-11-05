//
//  ViewController.swift
//  SpriteSheetProject
//
//  Created by Benny Davidovitz on 05/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let images = #imageLiteral(resourceName: "spritesheet").cropSpriteSheetImages(columns: 5, rows: 2)
        let imageView = UIImageView(image: images.first)
        
        imageView.animationImages = images
        imageView.animationDuration = 1 //second
        imageView.animationRepeatCount = 0 //infinite
        
        imageView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        
        self.view.addSubview(imageView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        
    }

    @objc func tapAction(_ sender : UITapGestureRecognizer){
        
        guard let imageView = sender.view as? UIImageView else{
            return
        }
        
        if imageView.isAnimating{
            imageView.stopAnimating()
        } else {
            imageView.startAnimating()
        }
        
    }


}















