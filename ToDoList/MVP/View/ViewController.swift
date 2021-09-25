//
//  ViewController.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit



class ViewController: UIViewController {
lazy var presenter = Presenter(with: self)
@IBOutlet weak var textLabel: UILabel!
override func viewDidLoad() {
    super.viewDidLoad()
    textLabel.isHidden = true
}
@IBAction func tapMeButton(_ sender: Any) {
    let next = CreateToDoViewController()
    navigationController?.pushViewController(next, animated: true)
    presenter.buttonTapped()
    }
}
extension ViewController: PresenterView {
   func showLabel() {
    textLabel.isHidden = false
}
    func setCustomLabel(custom:String){
        self.textLabel.text = custom
    }
}
