//
//  LabelViewController.swift
//  ProtocolorProject
//
//  Created by hackeru on 24/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController , ColorPickerViewControllerDelegate{

    enum Mode : String{
        case backgroundColor = "background"
        case textColor = "text"
    }
    
    var mode : Mode?
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func colorPickerViewControllerDidCancel(_ controller: ColorPickerViewController) {
        
    }
    
    func colorPickerViewController(_ controller: ColorPickerViewController, didSelectColor color: UIColor?) {
        
        guard let mode = mode else {
            return
        }
        
        switch mode {
        case .backgroundColor:
            label.backgroundColor = color
        case .textColor:
            label.textColor = color
        }
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let nextVC = segue.destination as? ColorPickerViewController,
            let raw = segue.identifier,
            let mode = Mode(rawValue: raw){
            nextVC.delegate = self
            
            self.mode = mode
            
            switch mode {
            case .backgroundColor:
                nextVC.baseColor = label.backgroundColor ?? .white
            case .textColor:
                nextVC.baseColor = label.textColor
            }
            
        }
        
    }
    

}














