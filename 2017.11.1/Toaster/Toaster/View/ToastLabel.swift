//
//  ToastLabel.swift
//  Toaster
//
//  Created by Benny Davidovitz on 01/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension String{
    func toast(duration : TimeInterval = 3){
        let window = UIApplication.shared.delegate?.window
        
        window??.showToast(with: self, duration: duration)
    }
}

extension UIView{
    func showToast(with text : String, duration : TimeInterval = 3){
        ToastLabel.show(with: text, on: self, duration: duration)
    }
}

class ToastLabel: UILabel {

    class func show(with text : String, on view : UIView, duration : TimeInterval){
        
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.show(with: text, on: view, duration: duration)
            }
            return
        }
        
        //Create Label & set Text
        var frame = view.bounds
        
        frame.origin.x = view.bounds.width * 0.1
        frame.size.width = view.bounds.width * 0.8
        frame.origin.y = view.bounds.height * 0.7
        frame.size.height = view.bounds.height * 0.2
        
        let label = ToastLabel(frame: frame)
        label.text = text
        
        //Add to view
        label.alpha = 0.1
        view.addSubview(label)
        
        //Animate Fade-In & Fade Out, then remove
        UIView.animate(withDuration: duration * 0.5, animations: {
            label.alpha = 1
        }) { (_) in
            //Fade out
            UIView.animate(withDuration: duration * 0.5, animations: {
                label.alpha = 0.1
            }, completion: { (_) in
                //Bye Bye
                label.removeFromSuperview()
            })
            
        }
    }

    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        textColor = .orange
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 24)
        
        layer.cornerRadius = 8
        layer.borderColor = textColor.cgColor
        layer.borderWidth = 2
        
    }

    
    
}




















