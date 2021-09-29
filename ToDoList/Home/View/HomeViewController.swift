//
//  HomeViewController.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit

protocol HomeView: AnyObject {
}

class HomeViewController: UIViewController, HomeView {
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private var tableView: UITableView!
    var presenter: HomePresenter!
    let createToDoViewController = String(describing: CreateToDoViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: UIView.tableViewCell, bundle: nil), forCellReuseIdentifier: UIView.tableViewCell)
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        addButton.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func addButtonTaped(_ sender: UIButton) {
        let createViewController = CreateToDoViewController(nibName: "CreateToDoViewController", bundle: nil)
        createViewController.createToDoDelegate = self
        navigationController?.pushViewController(createViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIView.tableViewCell, for: indexPath) as? TableViewCell
        cell?.toDoLabel.text = presenter.getItem(at:indexPath.row) ?? ""
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presentDeletionFailsafe(indexPath: indexPath)
        }
    }
    
    func presentDeletionFailsafe(indexPath: IndexPath) {
        let alert = UIAlertController(title: LocalizedStrings.DeleteAlert.title.localized, message: LocalizedStrings.DeleteAlert.message.localized, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: LocalizedStrings.DeleteAction.delete.localized, style: .default) { _ in
            self.presenter.removeItem(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(deleteAction)
        alert.addAction(UIAlertAction(title: LocalizedStrings.DeleteAlert.cancel.localized, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: CreateToDoViewControllerDelegate {
    func addNewItem(_ task: Task) {
        presenter.addNewItem(task)
        self.tableView.reloadData()
    }
}
