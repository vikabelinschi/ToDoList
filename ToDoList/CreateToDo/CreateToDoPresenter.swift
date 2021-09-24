//
//  UserPresenter.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import Foundation
import UserNotifications

protocol CreateToDoPresenter {
    var taskArray: [Task] { get }
    func saveData(with task: Task)
    func creareAlert(title: String, body: String)
}

class CreateToDoPresenterImp: CreateToDoPresenter {
    weak private var view: CreateToDoUserView?
    var taskArray: [Task] = []
    
    init(with view: CreateToDoUserView) {
        self.view = view
    }
    
    func saveData(with task: Task) {
        taskArray.append(task)
    }
    
    func creareAlert(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        //To Do Reminder for time from datePicker
    }
}
