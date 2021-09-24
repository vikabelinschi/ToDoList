//
//  CreateViewController.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 22.09.2021.
//

import UIKit
import UserNotifications

protocol CreateToDoUserView: AnyObject {
}

class CreateToDoViewController: UIViewController {
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var addItemTextField: UITextField!
    @IBOutlet weak private var switchButton: UISwitch!
    @IBOutlet weak private var datePicker: UIDatePicker!
    
    lazy var presenter: CreateToDoPresenter = CreateToDoPresenterImp(with: self)
    private let radius: CGFloat = 10
    private let notificationTitle = "TO DO APP"
    
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
        info.isReminderOn! ? presenter.creareAlert(title: notificationTitle, body: info.name!) : nil
    }
}

// MARK:- UIView

extension CreateToDoViewController: CreateToDoUserView {
    
}
