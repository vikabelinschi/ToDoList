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
    
    init(with view: CreateToDoView) {
        self.notificationService = NotificationService()
        self.view = view
    }
    
    func saveData(_ task: Task) {
            notificationService.createNotification(with: task)
        }
    }
