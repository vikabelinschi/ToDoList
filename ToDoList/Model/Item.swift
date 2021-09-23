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

func dummyData() -> [String]{
    var items: [Item] = []
    var names: [String] = []
    items.append(Item(name:"Buy Milk", date:nil, isReminderOn: false))
    items.append(Item(name:"Go To School", date:nil, isReminderOn: true))
    items.append(Item(name:"Get Up", date:nil, isReminderOn: true))
    for item in items{
        names.append(item.name ?? "nil")
    }
    return names
}


