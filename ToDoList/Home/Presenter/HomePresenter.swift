//
//  HomePresenter.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import Foundation

protocol HomePresenter: AnyObject {
    func getNumberOfRows() -> Int
    func getItem(at row: Int) -> String?
}

class HomePresenterImp: HomePresenter {
    weak var view: HomeView?
    var items: [Task] = []
    init(with view: HomeView) {
        self.view = view
    }
    
    func getNumberOfRows() -> Int {
        return items.count
    }
    
    func getItem(at row: Int) -> String? {
        return items[row].name
    }
}

