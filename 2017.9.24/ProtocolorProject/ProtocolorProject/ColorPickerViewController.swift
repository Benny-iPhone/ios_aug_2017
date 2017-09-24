//
//  ColorPickerViewController.swift
//  ProtocolorProject
//
//  Created by hackeru on 24/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit


protocol ColorPickerViewControllerDelegate{
    
    func colorPickerViewControllerDidCancel(_ controller : ColorPickerViewController)
    
    func colorPickerViewController(_ controller : ColorPickerViewController, didSelectColor color : UIColor?)
    
}

class ColorPickerViewController: UIViewController {

    var delegate : ColorPickerViewControllerDelegate?
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redSlider.value = 1
        blueSlider.value = 1
        greenSlider.value = 1
        alphaSlider.value = 1
        
        sliderAction()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderAction() {
        
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaSlider.value)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        self.view.backgroundColor = color
    }
    
    
    
    @IBAction func tripleTapAction(_ sender: Any) {
        
        delegate?.colorPickerViewControllerDidCancel(self)
        
        //back to prev view controller
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func swipeAction(_ sender: Any) {
        
        //notify delegate
        delegate?.colorPickerViewController(self, didSelectColor: self.view.backgroundColor)
        
        //back to prev view controller
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
