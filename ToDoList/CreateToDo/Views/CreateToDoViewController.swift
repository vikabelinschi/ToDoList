//
//  CreateViewController.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 22.09.2021.
//

import UIKit

protocol CreateToDoUserView: AnyObject {
}

class CreateToDoViewController: UIViewController {
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var addItemTextField: UITextField!
    @IBOutlet weak private var switchButton: UISwitch!
    @IBOutlet weak private var datePicker: UIDatePicker!
    
    lazy var presenter: CreateToDoPresenter = CreateToDoPresenterImp(with: self)
    private let radius: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemTextField.addBottomBorder()
        addButton.layer.cornerRadius = radius
        addButton.clipsToBounds = true
    }
    
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        if let text = addItemTextField.text, !text.isEmpty {
            let info = Task(name: addItemTextField.text ?? "nil", notificationDate: datePicker.date, isReminderOn: switchButton.isOn)
            presenter.saveData(with: info)
            navigationController?.popToRootViewController(animated: true)
            return
        }
    }
}

// MARK:- UIView

extension CreateToDoViewController: CreateToDoUserView {
    
}
