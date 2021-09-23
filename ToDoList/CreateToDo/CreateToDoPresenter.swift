//
//  UserPresenter.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import Foundation

protocol CreateToDoPresenter {
    var taskArray: [Task] { get }
    func saveData(with task: Task)
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
}
