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
            
            let calendar = Calendar.current.dateComponents([.hour,.minute,.day], from: task.notificationDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: calendar, repeats: false)
            let request = UNNotificationRequest(identifier: task.id, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error  {
                    let alert = UIAlertController(title: LocalizedStrings.Alert.title, message: error.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: LocalizedStrings.Alert.admit, style: .default, handler: .none)
                    return alert.addAction(alertAction)
                }
            }
        }
    }
    
    func deleteNotification(with task: Task) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [task.id]
        )
    }
}
