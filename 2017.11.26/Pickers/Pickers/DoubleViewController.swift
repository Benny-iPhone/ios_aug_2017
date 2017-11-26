//
//  DoubleViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 26/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class DoubleViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    let pickerArray : [[String]] = [
        ["Eli","Gabi","Keren","Shani"],
        ["Paz","Elkovski","Epstein"]
    ]
    
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var pickerView : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var arr : [String] = []
        
        for i in 0..<pickerView.numberOfComponents{
            let selectedRow = pickerView.selectedRow(inComponent: i)
            arr.append(pickerArray[i][selectedRow])
        }
        
        label.text = arr.joined(separator: " ")
                
    }
}
















