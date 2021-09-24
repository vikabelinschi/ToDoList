import UIKit

protocol CreateToDoView: AnyObject {
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
        presenter.saveData(name: addItemTextField.text, date: datePicker.date, isSwitchOn: switchButton.isOn)
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK:- UIView

extension CreateToDoViewController: CreateToDoView {
    
}
