//
//  UserPresenter.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import Foundation

protocol CreateToDoPresenter {
}

class CreateToDoPresenterImp: CreateToDoPresenter {
    weak private var view: CreateToDoUserView?
    
    init(with view: CreateToDoUserView) {
        self.view = view
    }
}
