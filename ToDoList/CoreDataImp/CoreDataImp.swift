//
//  CoreDataImp.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 28.09.2021.
//

import UIKit
import CoreData

class CoreDataImp {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData(taskArray: inout [Item], tableView: UITableView) {
        do{
        try taskArray = context.fetch(Item.fetchRequest())
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        } catch {
            
        }
    }
    
    func saveData(from task: Task) {
        let item = Item(context: context)
        item.id = task.id
        item.name = task.name
        item.notificationDate = task.notificationDate
        item.isReminderOn = task.isReminderOn
        do {
            try self.context.save()
        } catch {
            
        }
    }
    
    func deleteData(_ item: Item) {
        context.delete(item)
        do {
            try self.context.save()
        } catch {
            
        }
    }
    
}
