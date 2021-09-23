//
//  Presenter.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import Foundation

protocol PresenterView: AnyObject {
    func onItemsRetrieval(items: [String])
}

class Presenter {
    weak var view: PresenterView?
    private var items: [String]?
    init(with view: PresenterView) {
        self.view = view
    }
    
    func viewDidLoad() {
        showItems()
    }
    
    private func showItems() {
        self.items = dummyData()
        let items: [String]? = self.items
        view?.onItemsRetrieval(items: items ?? [])
    }
}


