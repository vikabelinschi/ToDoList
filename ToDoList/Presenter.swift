//
//  Presenter.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import Foundation


protocol PresenterView: AnyObject {
    func showLabel()
    func setCustomLabel(custom:String)
    
}
class Presenter {
weak var view: PresenterView?
init(with view: PresenterView) {
    self.view = view
}
    func buttonTapped() {
        let modelText = Model.label
        self.view?.setCustomLabel(custom:modelText)
        self.view?.showLabel()
    }

}
