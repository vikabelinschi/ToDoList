//
//  CreateToDoViewController.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 22.09.2021.
//

import UIKit
import UserNotifications

protocol CreateToDoViewControllerDelegate {
    func addNewItem(_ task: Task)
}

class CreateToDoViewController: UIViewController {
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var addItemTextField: UITextField!
    @IBOutlet weak private var switchButton: UISwitch!
    @IBOutlet weak private var datePicker: UIDatePicker!
    var createToDoDelegate: CreateToDoViewControllerDelegate?
    lazy var presenter: CreateToDoPresenter = CreateToDoPresenterImp(with: self)
    
    enum ButtonProperties {
        static let radius: CGFloat = 10
        static let shadowColor = UIColor.black.cgColor
        static let shadowOffset = CGSize(width: 2, height: 2)
        static let shadowRadius: CGFloat = 2
        static let shadowOpacity: Float = 0.8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        if let text = addItemTextField.text, !text.isEmpty {
            let info = Task(name: addItemTextField.text ?? "", notificationDate: datePicker.date, isReminderOn: switchButton.isOn)
            createToDoDelegate?.addNewItem(info)
            presenter.saveData(info)
            navigationController?.popToRootViewController(animated: true)
            return
        }
    }
    
    private func setupUI() {
        addItemTextField.addBottomBorder()
        addButton.layer.cornerRadius = ButtonProperties.radius
        addButton.clipsToBounds = true
        addButton.layer.shadowColor = ButtonProperties.shadowColor
        addButton.layer.shadowOffset = ButtonProperties.shadowOffset
        addButton.layer.shadowRadius = ButtonProperties.shadowRadius
        addButton.layer.shadowOpacity = ButtonProperties.shadowOpacity
        addButton.layer.masksToBounds = false
    }
}

// MARK:- UIView

extension CreateToDoViewController: CreateToDoView {
}
