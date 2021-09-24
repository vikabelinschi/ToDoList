//
//  Model.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import UIKit

public struct Task {
    let name: String?
    let date: Date?
    var isReminderOn: Bool?
    
    init(name: String?, date: Date?, isReminderOn: Bool?) {
        self.name = name
        self.date = date
        self.isReminderOn = isReminderOn
    }
}
