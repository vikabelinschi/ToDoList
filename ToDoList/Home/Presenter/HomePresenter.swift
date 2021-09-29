//
//  HomePresenter.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import Foundation

protocol HomePresenter: AnyObject {
    func getNumberOfRows() -> Int
    func getItem(at row: Int) -> Task
    func getItemName(at row: Int) -> String
    func addNewItem(_ task: Task)
    func removeItem(at row: Int)
    func editItem(at row: Int,_ task: Task)
}
