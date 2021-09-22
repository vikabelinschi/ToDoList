//
//  CreateViewController.swift
//  ToDoList
//
//  Created by Nicolae Lupu on 22.09.2021.
//

import UIKit

class CreateViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addItemTextField: UITextField!
    let radius: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemTextField.addBottomBorder()
        addButton.layer.cornerRadius = radius
        addButton.clipsToBounds = true
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
    }
}
