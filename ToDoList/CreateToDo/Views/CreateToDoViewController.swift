//
//  CreateToDoViewController.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 22.09.2021.
//

import UIKit
import UserNotifications

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
        presenter.saveData(name: addItemTextField.text, date: datePicker.date, isSwitchOn: switchButton.isOn)
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK:- UIView

extension CreateToDoViewController: CreateToDoView {
    func createAlert(_ error: Error?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(alertAction)
    }
}
