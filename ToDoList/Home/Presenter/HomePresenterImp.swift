//
//  HomePresenterImp.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 29.09.2021.
//

import Foundation

class HomePresenterImp: HomePresenter {
    weak var view: HomeView?
    var items: [Task] = []
    init(with view: HomeView) {
        self.view = view
    }
    
    func getNumberOfRows() -> Int {
            return items.count
    }
    
    func getItem(at row: Int) -> Task{
        return items[row]
    }
    
    func getItemName(at row: Int) -> String{
        return items[row].name
    }
    
    func addNewItem(_ task: Task) {
        items.append(task)
    }
 
    func removeItem(at row: Int) {
        items.remove(at: row)
    }
    
    func editItem(at row: Int, _ task: Task) {
        items[row] = task
    }
    
}
