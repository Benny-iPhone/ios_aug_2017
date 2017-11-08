//
//  ViewController.swift
//  ImageFromUrl
//
//  Created by Benny Davidovitz on 08/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loadAction(_ sender: Any) {
        
        imageView.image = nil
        
        let urlString = "http://i.ytimg.com/vi/uHQ3e6in6DE/maxresdefault.jpg"
        
        guard let url = URL(string: urlString) else{
            print("url not valid")
            return
        }
        
        imageView.sd_setImage(with: url)
        
        /*
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else{
                print("no data")
                return
            }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
            
        }
 */
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

