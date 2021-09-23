//
//  UserPresenter.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import Foundation

protocol UserPresenter {
    var taskArray: [Task] { get }
    func SaveData(with task: Task)
}

class UserPresenterImp: UserPresenter {
    private var view: UserView?
    var taskArray: [Task] = []
    
    init(with view: UserView) {
        self.view = view
    }
    
    func SaveData(with task: Task) {
        taskArray.append(task)
    }
}
