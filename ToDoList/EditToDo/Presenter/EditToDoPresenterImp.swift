//
//  EditToDoPresenterImp.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 29.09.2021.
//

import Foundation

class EditToDoPresenterImp: EditToDoPresenter {
    weak private var view: EditToDoView?
    
    init(with view: EditToDoView) {
        self.view = view
    }
}
