//
//  UserPresenter.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import Foundation

protocol UserPresenter {
    func SaveData(with task: Task)
}

class UserPresenterImp: UserPresenter {
    private var view: UserView?
    
    init(with view: UserView) {
        self.view = view
    }
    
    var taskArray: [Task] = []
    
    func SaveData(with task: Task) {
        taskArray.append(task)
        print(task)
    }
}
