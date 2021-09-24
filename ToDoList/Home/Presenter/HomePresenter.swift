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
    func getItem(_ int: Int) -> String
}

class HomePresenterImp: HomePresenter {
    weak var view: HomeView?
    var items: [String]?
    init(with view: HomeView) {
        self.view = view
        self.items = dummyData()
    }
    
    func viewDidLoad() {
        view?.onItemsRetrieval()
    }
    
    func getNumberOfRows() -> Int {
        return items?.count ?? 0
    }
    
    func getItem(_ int: Int) -> String {
        return items?[int] ?? ""
    }
}

