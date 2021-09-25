//
//  CreateToDoPresenterImp.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import Foundation
import UserNotifications

class CreateToDoPresenterImp: CreateToDoPresenter {
    weak private var view: CreateToDoView?
    var taskArray: [Task] = []
    
    init(with view: CreateToDoView) {
        self.view = view
    }
    
    func saveData(name: String?, date: Date?, isSwitchOn: Bool?) {
            let task = Task(name: name, date: date, isReminderOn: isSwitchOn)
            taskArray.append(task)
    }
    
    func createNotification(title: String, body: String, date: Date?) {
        if taskArray.last!.isReminderOn! {
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = .default
            
            let calendar = Calendar.current.dateComponents([.hour,.minute,.day], from: date!)
            let trigger = UNCalendarNotificationTrigger(dateMatching: calendar, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) { error in
                if error != nil {
                    self.view?.createAlert(error)
                }
            }
        }
    }
}
