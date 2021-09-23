//
//  CreateViewController.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 22.09.2021.
//

import UIKit

protocol UserView {
}

class CreateViewController: UIViewController, UserView {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    lazy var presenter: UserPresenter = UserPresenterImp(with: self)
    let radius: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemTextField.addBottomBorder()
        addButton.layer.cornerRadius = radius
        addButton.clipsToBounds = true
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let info = Task(name: addItemTextField.text, date: datePicker.date, isReminderOn: switchButton.isOn)
        presenter.SaveData(with: info)
        
        navigationController?.popToRootViewController(animated: true)
    }
}
