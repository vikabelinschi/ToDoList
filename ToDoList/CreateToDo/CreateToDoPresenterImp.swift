//
//  CreateToDoPresenterImp.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import Foundation

class CreateToDoPresenterImp: CreateToDoPresenter {
    private let notificationService: NotificationService
    weak private var view: CreateToDoView?
    internal var taskArray: [Task] = []
    
    init(with view: CreateToDoView) {
        self.notificationService = NotificationService()
        self.view = view
    }
    
    func saveData(name: String?, date: Date, isSwitchOn: Bool) {
        if let extractedName = name {
            let task = Task(name: extractedName, notificationDate: date, isReminderOn: isSwitchOn)
            taskArray.append(task)
            notificationService.createNotification(with: task)
        }
    }
}
