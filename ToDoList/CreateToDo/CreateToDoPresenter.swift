import Foundation

protocol CreateToDoPresenter {
    var taskArray: [Task] { get }
    func saveData(name: String?, date: Date?, isSwitchOn: Bool?)
}

class CreateToDoPresenterImp: CreateToDoPresenter {
    weak private var view: CreateToDoView?
    var taskArray: [Task] = []
    
    init(with view: CreateToDoView) {
        self.view = view
    }
    
    func saveData(name: String?, date: Date?, isSwitchOn: Bool?) {
        let task = Task(name: name, date: date, isReminderOn: isSwitchOn)
        taskArray.append(task)
    }
}
