//
//  CreateToDoPresenterImp.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import Foundation

class CreateToDoPresenterImp: CreateToDoPresenter {
    weak private var view: CreateToDoView?
    internal var taskArray: [Task] = []
    
    init(with view: CreateToDoView) {
        self.view = view
    }
    
    func saveData(name: String?, date: Date, isSwitchOn: Bool) {
        if let extractedName = name {
            let task = Task(name: extractedName, notificationDate: date, isReminderOn: isSwitchOn)
            taskArray.append(task)
            let notificationManager = NotificationService()
            notificationManager.createNotification(with: task)
        }
    }
}
