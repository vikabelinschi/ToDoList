//
//  CreateToDoPresenter.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 24.09.2021.
//

import Foundation

protocol CreateToDoPresenter {
    var taskArray: [Task] { get }
    func saveData(name: String?, date: Date, isSwitchOn: Bool)
}
