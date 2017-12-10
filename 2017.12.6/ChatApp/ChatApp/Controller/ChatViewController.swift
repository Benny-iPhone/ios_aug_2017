//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 10/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {
    
    var chatRoom : ChatRoom!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = chatRoom.name
        self.senderId = AuthLogic.shared.currentUserId
        self.senderDisplayName = AuthLogic.shared.currentUserName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
