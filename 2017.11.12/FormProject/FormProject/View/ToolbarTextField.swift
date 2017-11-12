//
//  ToolbarTextField.swift
//  FormProject
//
//  Created by Benny Davidovitz on 12/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ToolbarTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        createToolbar()
    }
    
    private func createToolbar(){
        
        let str = self.returnKeyType == .next ? "Next" : "Go"
        
        let button = UIBarButtonItem(title: str, style: .done, target: self, action: #selector(buttonAction(_:)))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        toolbar.items = [spaceButton,button]
        
        self.inputAccessoryView = toolbar
        
        
    }
    
    @objc func buttonAction(_ sender : UIBarButtonItem){
        self.sendActions(for: .editingDidEndOnExit)
    }

}













