//
//  Model.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 23.09.2021.
//

import UIKit

public struct Task {
    let id = UUID().uuidString
    let name: String
    let notificationDate: Date
    var isReminderOn: Bool

    init(name: String, notificationDate: Date, isReminderOn: Bool = false) {
        self.name = name
        self.notificationDate = notificationDate
        self.isReminderOn = isReminderOn
    }
}
