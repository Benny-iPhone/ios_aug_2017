//
//  ViewController.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 29/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension UIColor{
    class var random : UIColor{
        get{
            return UIColor(
                red: CGFloat(arc4random_uniform(256)) / 255,
                green: CGFloat(arc4random_uniform(256)) / 255,
                blue: CGFloat(arc4random_uniform(256)) / 255,
                alpha: 1)
        }
    }
}

//https://stackoverflow.com/questions/4334233/how-to-capture-uiview-to-uiimage-without-loss-of-quality-on-retina-display
extension UIView {
    public func getSnapshotImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return snapshotImage
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    
    @IBAction func clearAction(_ sender: Any) {
        drawView.clear()
    }
    
    @IBAction func strokeWidthAction(_ sender: UISlider) {
        drawView.strokeWidth = CGFloat(sender.value)
    }
    
    @IBAction func colorAction(_ sender: UIBarButtonItem) {
        let color = UIColor.random
        
        drawView.strokeColor = color
        sender.tintColor = color
    }
    
    @IBAction func undoAction(_ sender: Any) {
        drawView.undo()
    }
    
    @IBAction func redAction(_ sender: Any) {
        drawView.redo()
    }
    
    @IBAction func shareAction(_ sender: Any){
        
        let image = drawView.getSnapshotImage()
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        
    }
}















