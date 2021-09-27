//
//  NotificationService.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 27.09.2021.
//

import UIKit
import UserNotifications

class NotificationService {
        
    func createNotification(with task: Task) {
        if task.isReminderOn {
            let content = UNMutableNotificationContent()
            content.title = task.name
            content.sound = .default
            
            let calendar = Calendar.current.dateComponents([.hour,.minute,.day], from: task.date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: calendar, repeats: false)
            let request = UNNotificationRequest(identifier: task.UUIDstring, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) { error in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .default, handler: .none)
                    alert.addAction(alertAction)
                }
            }
        }
    }
}
