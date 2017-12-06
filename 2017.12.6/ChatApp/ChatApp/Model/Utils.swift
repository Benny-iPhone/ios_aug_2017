//
//  Utils.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 06/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import PKHUD

extension String{
    func showError(){
        let content = HUDContentType.labeledError(title: "oh crap 💩", subtitle: self)
        HUD.flash(content, delay: 1.5)
    }
    
    func showSuccess(){
        let content = HUDContentType.labeledSuccess(title: "yay 😀", subtitle: self)
        HUD.flash(content, delay: 1.5)
    }
}











