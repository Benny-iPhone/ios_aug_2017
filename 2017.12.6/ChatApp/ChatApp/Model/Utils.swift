//
//  Utils.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 06/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import PKHUD
import JSQMessagesViewController

extension UIColor{
    class var randomDark : UIColor{
        return UIColor(red: CGFloat(arc4random_uniform(128) + 64) / 255,
                       green: CGFloat(arc4random_uniform(128) + 64) / 255,
                       blue: CGFloat(arc4random_uniform(128) + 64) / 255,
                       alpha: 1)
    }
}

extension JSQMessage{
    var isOutgoing : Bool{
        return self.senderId == AuthLogic.shared.currentUserId
    }
}

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











