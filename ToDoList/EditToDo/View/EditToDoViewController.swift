//
//  EditToDoViewController.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 29.09.2021.
//

import Foundation
import UIKit

protocol EditToDoViewControllerDelegate {
    func getEditedItem(at row: Int,_ task: Task)
}

class EditToDoViewController: UIViewController {
    @IBOutlet weak private var saveButton: UIButton!
    @IBOutlet weak private var editItemTextField: UITextField!
    @IBOutlet weak private var switchButton: UISwitch!
    @IBOutlet weak private var datePicker: UIDatePicker!
    var editToDoViewControllerDelegate: EditToDoViewControllerDelegate?
    var item: Task?
    var itemIndex: Int = 0
    let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        editItemTextField.text = item?.name
        setSwitchButton()
        datePicker.date = item?.notificationDate ?? Date()
    }
    
    enum ButtonProperties {
        static let radius: CGFloat = 10
        static let shadowColor = UIColor.black.cgColor
        static let shadowOffset = CGSize(width: 2, height: 2)
        static let shadowRadius: CGFloat = 2
        static let shadowOpacity: Float = 0.8
    }
    
    private func setSwitchButton() {
        if item?.isReminderOn == true {
            switchButton.setOn(true, animated: true)
        }
        else {
            switchButton.setOn(false, animated: true)
        }
    }
    
    private func setupUI() {
        editItemTextField.addBottomBorder()
        saveButton.layer.cornerRadius = ButtonProperties.radius
        saveButton.clipsToBounds = true
        saveButton.layer.shadowColor = ButtonProperties.shadowColor
        saveButton.layer.shadowOffset = ButtonProperties.shadowOffset
        saveButton.layer.shadowRadius = ButtonProperties.shadowRadius
        saveButton.layer.shadowOpacity = ButtonProperties.shadowOpacity
        saveButton.layer.masksToBounds = false
    }
    
    @IBAction private func saveButtonTapped(_ sender: UIButton) {
        let editedItem = Task(name: editItemTextField.text ?? "", notificationDate: datePicker.date, isReminderOn: switchButton.isOn)
        editToDoViewControllerDelegate?.getEditedItem(at: itemIndex, editedItem)
        navigationController?.popToRootViewController(animated: true)
        return
    }
}

extension EditToDoViewController: EditToDoView {
}


