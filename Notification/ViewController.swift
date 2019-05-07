//
//  ViewController.swift
//  Notification
//
//  Created by Md Zahidul Islam Mazumder on 8/5/19.
//  Copyright © 2019 Md Zahidul islam. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func localNotification(_ sender: UIButton) {
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Time is up"
        content.body = "You need to check"
        content.sound = .default
        
        let date = Calendar.current.dateComponents([.day,.month,.year,.hour,.minute,.second], from: Date().addingTimeInterval(5))
        let triger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
            //UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "alert", content: content, trigger: triger)
        center.add(request) { (error) in
            if error != nil {
                print(error!)
            }
        }
        
        
    }
    
}

