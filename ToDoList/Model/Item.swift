//
//  Item.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit

public struct Item {
    let name: String?
    let date: Date?
    var isReminderOn: Bool?
    
    init(name: String?, date: Date?, isReminderOn: Bool?) {
        self.name = name
        self.date = date
        self.isReminderOn = isReminderOn
    }
}

func dummyData() -> [String] {
    return  ["Buy Milk", "Go To School", "Get Up" ]
}


