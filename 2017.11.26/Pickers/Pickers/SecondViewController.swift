//
//  SecondViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 26/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let pickerArray : [String] = [
        "High Sierra",
        "Sierra",
        "El Capitan",
        "Yosemite",
        "Mavericks",
        "Mountain Lion",
        "Lion",
        "Snow Leopard",
        "Leopard",
        "Tiger",
        "Panther",
        "Jaguar",
        "Puma",
        "Cheetah",
        "Kodiak"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        self.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
    }

}

extension SecondViewController : UIPickerViewDataSource, UIPickerViewDelegate
{
    //Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    //Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = pickerArray[row]
    }
}






























