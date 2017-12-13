//
//  ChatMessage.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 13/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import JSQMessagesViewController

class ChatMessage : JSQMessage{
    let avatarUrl : URL?
    let imageUrl : URL?
    
    init?(_ dict : [String:Any]) {
        guard let uid = dict["uid"] as? String,
            let timestamp = dict["date"] as? TimeInterval,
            let text = dict["text"] as? String,
            let senderName = dict["sender_name"] as? String else{
                return nil
        }
        
        if let avatarUrl = dict["avatar_url"] as? String{
            self.avatarUrl = URL(string: avatarUrl)
        } else {
            self.avatarUrl = nil
        }
        
        let date = Date(timeIntervalSince1970: timestamp)
        
        if let imageUrlString = dict["image_url"] as? String,
            let url = URL(string: imageUrlString){
            //image found, media message
            self.imageUrl = url
            let myMedia = JSQPhotoMediaItem(image: #imageLiteral(resourceName: "icon_placeholder"))
            super.init(senderId: uid, senderDisplayName: senderName, date: date, media: myMedia)
            
        } else {
            //text message
            self.imageUrl = nil
            super.init(senderId: uid,
                   senderDisplayName: senderName,
                   date: date,
                   text: text)
            
        }
 
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}








