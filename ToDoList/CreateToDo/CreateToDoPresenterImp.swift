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
    internal var taskArray: [Task] = []
    private let notificationTitle = "TO DO APP"
    
    init(with view: CreateToDoView) {
        self.view = view
    }
    
    func saveData(name: String?, date: Date?, isSwitchOn: Bool?) {
        let task = Task(name: name, date: date, isReminderOn: isSwitchOn)
        taskArray.append(task)
        createNotification(with: task)
    }
    
    private func createNotification(with task: Task) {
        if task.isReminderOn! {
            let content = UNMutableNotificationContent()
            content.title = notificationTitle
            content.body = task.name!
            content.sound = .default
            
            let calendar = Calendar.current.dateComponents([.hour,.minute,.day], from: task.date!)
            let trigger = UNCalendarNotificationTrigger(dateMatching: calendar, repeats: false)
            let request = UNNotificationRequest(identifier: task.UUIDstring, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) { error in
                if error != nil {
                    self.view?.createAlert(error)
                }
            }
        }
    }
}
