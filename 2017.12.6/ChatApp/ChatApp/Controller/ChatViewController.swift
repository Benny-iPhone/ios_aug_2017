//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 10/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import JSQMessagesViewController
import SDWebImage

class ChatViewController: JSQMessagesViewController {
    
    var chatRoom : ChatRoom!
    let enteringRoomDate = Date()
    var messages : [ChatMessage] = []
    
    //bubbles
    var outgoingBubble : JSQMessagesBubbleImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let factory = JSQMessagesBubbleImageFactory()
        outgoingBubble = factory?.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleRed())

        navigationItem.title = chatRoom.name
        self.senderId = AuthLogic.shared.currentUserId
        self.senderDisplayName = AuthLogic.shared.currentUserName
        
        DatabaseLogic.shared.trackNewMessage(room: self.chatRoom) { (msg) in
            //add new message to array
            self.messages.append(msg)
            
            let shouldPlay = msg.date.timeIntervalSince(self.enteringRoomDate) > 0
            
            if msg.isOutgoing{
                //refresh UI
                self.finishSendingMessage()
                //play sound
                if shouldPlay{
                    JSQSystemSoundPlayer.jsq_playMessageSentSound()
                }
            } else {
                //refresh UI
                self.finishReceivingMessage()
                //play sound
                if shouldPlay{
                    JSQSystemSoundPlayer.jsq_playMessageReceivedSound()
                }
                
            }
            
        }
    }
    
    //MARK: - Support Collection View
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        
        let msg = messages[indexPath.item]
        
        let url = msg.avatarUrl
        cell.avatarImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "icon_avatar"))
        cell.avatarImageView.layer.cornerRadius = cell.avatarImageView.bounds.width / 2
        cell.avatarImageView.layer.masksToBounds = true
        
        if let imageUrl = msg.imageUrl{
            let imageView = cell.messageBubbleContainerView.subviews.first as? UIImageView
            imageView?.sd_setImage(with: imageUrl)
        }
        
        
        return cell
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    //MARK: - Bubble
    
    var bubbles : [String:JSQMessagesBubbleImage] = [:]
    
    func incomingBubbleFor(id : String) -> JSQMessagesBubbleImage
    {
        if let b = bubbles[id]{
            return b
        }
        
        let factory = JSQMessagesBubbleImageFactory()!
        let b = factory.incomingMessagesBubbleImage(with: UIColor.randomDark)!
        
        bubbles[id] = b
        
        return b
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        let msg = messages[indexPath.item]
        
        if msg.isOutgoing{
            return outgoingBubble
        } else {
            return incomingBubbleFor(id: msg.senderId)
        }
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    //MARK: - Sender Name
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        
        let msg = messages[indexPath.item]
        if msg.isOutgoing{
            return nil
        }
        let text = msg.senderDisplayName
        
        return NSAttributedString(string: text ?? "",
                                  attributes:
            [
                NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16),
                NSAttributedStringKey.foregroundColor: UIColor.black
            ]
        )
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        
        let msg = messages[indexPath.item]
        if msg.isOutgoing{
            return 0
        }
        
        return 17
        
    }
    
    //MARK: - Time
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForCellBottomLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let str = formatter.string(from: messages[indexPath.item].date)
        
        return NSAttributedString(string: str)
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForCellBottomLabelAt indexPath: IndexPath!) -> CGFloat {
        return 12
    }
    
    //MARK: - Action

    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        //send message to server
        DatabaseLogic.shared.createMessage(with: text, room: self.chatRoom)
        
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
    }

}

extension ChatViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            DatabaseLogic.shared.createMessage(with: "", image: image, room: self.chatRoom)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}















