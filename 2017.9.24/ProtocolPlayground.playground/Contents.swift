//: Playground - noun: a place where people can play

import UIKit

protocol Driver{
    
    func stopDriving()
    func drive(at speed : Double)
    
}

protocol ColorPickerViewControllerDelegate{
    func colorPicker(_ controller : ColorPickerViewController, didSelect color : UIColor)
    func colorPickerDidCancel(_ controller : ColorPickerViewController)
}

class ColorPickerViewController : UIViewController{
    
    typealias Callback = (UIColor?)->Void
    
    var callback : Callback?
    var delegte : ColorPickerViewControllerDelegate?
    
    func xButtonPressed(){
        callback?(nil)
        delegte?.colorPickerDidCancel(self)
    }
    
    func donePressed(){
        callback?(.black)
        delegte?.colorPicker(self, didSelect: .black)
    }
    
}
































