//
//  ViewController.swift
//  NotificationsProject
//
//  Created by Benny Davidovitz on 24/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let action = UNNotificationAction(identifier: "action", title: "Do Something", options: .authenticationRequired)
        
        let reply = UNTextInputNotificationAction(identifier: "reply", title: "Reply", options: .authenticationRequired, textInputButtonTitle: "Send", textInputPlaceholder: "Type your response")
        
        let category = UNNotificationCategory(identifier: "cat", actions: [action,reply], intentIdentifiers: [], options: UNNotificationCategoryOptions.hiddenPreviewsShowTitle)
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert, .carPlay]) { (success, error) in
            if !success{
                print(error?.localizedDescription ?? "")
            } else {
                print("permission granted")
                
                //request for device token
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
                
                
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func buttonAction(_ sender: Any) {
        var components = Calendar.current.dateComponents([.hour,.minute], from: datePicker.date)
        components.second = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = textField.text ?? "you forgot text"
        //content.sound = UNNotificationSound.default()
        content.sound = UNNotificationSound(named: "sound.wav")
        content.badge = 1
        content.categoryIdentifier = "cat"
        
        if let url = Bundle.main.url(forResource: "video", withExtension: "mp4")
        {
            do{
                let attachment = try UNNotificationAttachment(identifier: "video", url: url, options: nil)
                content.attachments = [attachment]
            } catch {
                print(error)
            }
        }
        
        let identifier = UUID().uuidString
        debugPrint(identifier)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (err) in
            if let err = err{
                debugPrint(err)
            }
        }
        
    }
    

    


}
















