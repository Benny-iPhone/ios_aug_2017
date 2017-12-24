//
//  AppDelegate.swift
//  NotificationsProject
//
//  Created by Benny Davidovitz on 24/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , UNUserNotificationCenterDelegate{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        application.applicationIconBadgeNumber = 0
        
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        print(deviceToken)
        
        let data = deviceToken as NSData
        print(data)
        
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        switch response.actionIdentifier {
        case "action":
           
            //nudnik
            let content = response.notification.request.content
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString,
                                                content: content,
                                                trigger: trigger)
            
            center.add(request, withCompletionHandler: { err in
                print(err?.localizedDescription ?? "")
            })
            
        case "reply":
            
            //catch text
            let text = (response as? UNTextInputNotificationResponse)?.userText ?? ""
            print(text)
            
        default:
            break
        }
        
        completionHandler()
        
    }
}
























