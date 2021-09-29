//
//  HomePresenter.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import Foundation

protocol HomePresenter: AnyObject {
    func viewDidLoad()
    func getNumberOfRows() -> Int
    func getItem(at row: Int) -> String?
    func addTask(task: Item)
}

class HomePresenterImp: HomePresenter {
    weak var view: HomeView?
    var items: [Item] = []
    weak private var createView: CreateToDoView?
    
    init(with view: HomeView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.onItemsRetrieval()
    }
    
    func getNumberOfRows() -> Int {
        return items.count
    }
    
    func getItem(at row: Int) -> String? {
        return items[row].name
    }
    
    func addTask(task: Item) {
        items.append(task)
    }
}

