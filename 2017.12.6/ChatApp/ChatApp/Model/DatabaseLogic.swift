//
//  DatabaseLogic.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 06/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Firebase
import JSQMessagesViewController

class DatabaseLogic{
    static let shared = DatabaseLogic()
    
    let usersRef : DatabaseReference
    let chatroomsRef : DatabaseReference
    let messagesRef : DatabaseReference
    
    private init(){
        let rootRef = Database.database().reference()
        usersRef = rootRef.child("users")
        chatroomsRef = rootRef.child("chatrooms")
        messagesRef = rootRef.child("messages")
    }
    
    func trackNewMessage(room : ChatRoom, callback : @escaping (ChatMessage)->Void){
        
        messagesRef.child(room.id).observe(.childAdded) { (snapshot) in
            
            guard let dict = snapshot.value as? [String:Any] else{
                return
            }
            
            if let msg = ChatMessage(dict){
                callback(msg)
            }
            
            
            
        }
        
    }
    
    func createMessage(with text : String, image : UIImage? = nil, room : ChatRoom){
        guard let uid = AuthLogic.shared.currentUserId else {
            return
        }
        
        let name = AuthLogic.shared.currentUserName ?? ""
        
        var dict : [String:Any] = [
            "uid":uid,
            "text":text,
            "date":Date().timeIntervalSince1970,
            "sender_name":name
        ]
        
        if let url = AuthLogic.shared.currentUserPhotoUrl?.absoluteString{
            dict["avatar_url"] = url
        }
        
        //messages->room_id->message_id->value
        let msgRef = messagesRef.child(room.id).childByAutoId()
        
        
        guard let image = image, let data = UIImageJPEGRepresentation(image, 0.4) else{
            if text.isEmpty == false{
                msgRef.setValue(dict)
            }
            return
        }
        
        let filename = UUID().uuidString + ".jpg"
        
        let storageRef = Storage.storage().reference().child(room.id).child(msgRef.key).child(filename)
        
        
  
        storageRef.putData(data, metadata: nil) { (metadata, error) in
            guard let url = metadata?.downloadURL() else{
                error?.localizedDescription.showError()
                return
            }
            
            dict["image_url"] = url.absoluteString
            msgRef.setValue(dict)
        }
    }
    
    func removeRoom(_ room : ChatRoom){
        //chatroomsRef.child(room.id).removeValue()
        chatroomsRef.child(room.id).setValue(nil)
    }
    
    func trackAllRooms(with completion : @escaping ([ChatRoom])->Void) -> UInt{
        
        return chatroomsRef.observe(.value, with: { (snapshot) in
            
            guard let rawData = snapshot.value as? [String:Any] else{
                if snapshot.value is NSNull{
                    completion([])
                }
                return
            }
            
            var rooms : [ChatRoom] = []
            
            for (key,val) in rawData{
                guard let dict = val as? [String:Any] else{
                    continue
                }
                
                let c = ChatRoom(key: key, dict: dict)
                rooms.append(c)
            }
            
            completion(rooms)
            
            
            
        })
        
    }
    
    func createRoom(with name : String){
        guard let uid = AuthLogic.shared.currentUserId else {
            return
        }
        
        let dict : [String:Any] = [
            "name":name,
            "owner":uid,
            "date":Date().timeIntervalSince1970
        ]
        
        chatroomsRef.childByAutoId().setValue(dict)
        
    }
    
    
    
    func write(user : User){
        
        var dict : [String:Any] = [
            "name":user.displayName ?? "no name",
            "email":user.email ?? "no email"
        ]
        
        if let photoUrl = user.photoURL{
            dict["photoUrl"] = photoUrl.path
        }
        
        usersRef.child(user.uid).setValue(dict)
    }
    
    func trackAllUsers(with callback : @escaping ([String:Any])->Void)
    {
        usersRef.observe(DataEventType.childAdded) { (snapshot) in
            
            guard let dict = snapshot.value as? [String:Any] else{
                return
            }
            
            callback(dict)
            
        }
    }
}











