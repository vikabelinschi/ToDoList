//
//  CreateViewController.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 22.09.2021.
//

import UIKit

protocol UserView: AnyObject {
}

class CreateViewController: UIViewController {
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var addItemTextField: UITextField!
    @IBOutlet weak private var switchButton: UISwitch!
    @IBOutlet weak private var datePicker: UIDatePicker!
    
    lazy var presenter: UserPresenter = UserPresenterImp(with: self)
    let radius: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemTextField.addBottomBorder()
        addButton.layer.cornerRadius = radius
        addButton.clipsToBounds = true
    }
    
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        let info = Task(name: addItemTextField.text, date: datePicker.date, isReminderOn: switchButton.isOn)
        presenter.saveData(with: info)
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK:- UIView

extension CreateViewController: UserView {
    
}
