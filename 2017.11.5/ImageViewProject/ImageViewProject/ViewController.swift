//
//  ViewController.swift
//  ImageViewProject
//
//  Created by Benny Davidovitz on 05/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //just type the image name and you will get a preview and UIImage instance
        let icon : UIImage = #imageLiteral(resourceName: "appstore").withRenderingMode(.alwaysTemplate)
        //let image : UIImage? = UIImage(named: "appstore")
        
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x:40,y:180), size: icon.size))
        imageView.image = icon
        imageView.tintColor = .blue
        
        self.view.addSubview(imageView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}













