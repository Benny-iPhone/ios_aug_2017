//
//  ViewController.swift
//  LabelProject
//
//  Created by Benny Davidovitz on 01/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let label = CustomLabel(frame: CGRect(x: 8, y: 36, width: 0, height: 0))
        label.text = "Hello From the\nother\nside"
        label.sizeToFit()
        
        self.view.addSubview(label)
        label.frame.size.width += 16
        label.frame.size.height += 8
        
        self.view.backgroundColor = .lightGray
        
        configureLabel(with: 4.9)
        
    }

    func configureLabel(with amount : Double){
        let str = String(format:"%.2f $",amount)
        let atts : [NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:UIFont.italicSystemFont(ofSize: 24)
        ]
        
        let attString = NSMutableAttributedString(string: str, attributes: atts)
        
        let spaceRange : NSRange = (str as NSString).range(of: " ")
        //make sure that space char found
        guard spaceRange.location != NSNotFound else{
            currencyLabel.attributedText = attString
            return
        }
        
        let numberRange : NSRange = NSMakeRange(0, spaceRange.location)
        attString.addAttribute(.foregroundColor, value: UIColor.purple, range: numberRange)
        
        let currenyRange : NSRange = NSMakeRange(spaceRange.location + spaceRange.length, 1)
        attString.addAttribute(.foregroundColor, value: UIColor.orange, range: currenyRange)
        attString.addAttribute(.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: currenyRange)
        attString.addAttribute(.underlineColor, value: UIColor.white, range: currenyRange)
        
        currencyLabel.attributedText = attString
                
        
        //currencyLabel.text = str
        
        /*
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        //formatter.currencyCode = "ILS"
        formatter.currencySymbol = "Ɛ"

        currencyLabel.text = formatter.string(from: amount as NSNumber)
 */
        
    }


}
















