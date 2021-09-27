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
    
    enum ButtonProperties {
        static let radius: CGFloat = 10
        static let shadowColor = UIColor.black.cgColor
        static let shadowOffset = CGSize(width: 2, height: 2)
        static let shadowRadius: CGFloat = 2
        static let shadowOpacity: Float = 0.8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemTextField.addBottomBorder()
        addButton.layer.cornerRadius = ButtonProperties.radius
        addButton.clipsToBounds = true
        addButton.layer.shadowColor = ButtonProperties.shadowColor
        addButton.layer.shadowOffset = ButtonProperties.shadowOffset
        addButton.layer.shadowRadius = ButtonProperties.shadowRadius
        addButton.layer.shadowOpacity = ButtonProperties.shadowOpacity
        addButton.layer.masksToBounds = false
    }
    
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        presenter.saveData(name: addItemTextField.text, date: datePicker.date, isSwitchOn: switchButton.isOn)
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK:- UIView

extension CreateToDoViewController: CreateToDoView {

}
