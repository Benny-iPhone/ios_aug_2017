//
//  SocialMediaViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 26/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class SocialMediaViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    let pickerArray : [UIImage] = [#imageLiteral(resourceName: "icons8-youtube"),#imageLiteral(resourceName: "icons8-twitter"),#imageLiteral(resourceName: "icons8-linkedin"),#imageLiteral(resourceName: "icons8-facebook"),#imageLiteral(resourceName: "icons8-google_plus"),#imageLiteral(resourceName: "icons8-instagram_new")]
    
    @IBOutlet weak var pickerView : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spin()
    }
    
    @IBAction func spin(){
        for i in 0..<pickerView.numberOfComponents{
            let max = pickerView.numberOfRows(inComponent: i)
            let randomRow = Int(arc4random_uniform(UInt32(max)))
            pickerView.selectRow(randomRow, inComponent: i, animated: true)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10 * pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let img : UIImage = pickerArray[row % pickerArray.count]
        return UIImageView(image: img)
        
    }

}










