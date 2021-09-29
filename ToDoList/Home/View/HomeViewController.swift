//
//  HomeViewController.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit

class HomeViewController: UIViewController, HomeView {
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private var tableView: UITableView!
    var presenter: HomePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
    
    private func setupUI(){
        tableView.register(UINib(nibName: UIView.tableViewCell, bundle: nil), forCellReuseIdentifier: UIView.tableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        addButton.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editToDoViewController = EditToDoViewController(nibName: "EditToDoViewController", bundle: nil)
        let myItem = presenter.getItem(at: indexPath.row)
        let myItemIndex = indexPath.row
        editToDoViewController.item = myItem
        editToDoViewController.itemIndex = myItemIndex
        editToDoViewController.editToDoViewControllerDelegate = self
        navigationController?.pushViewController(editToDoViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIView.tableViewCell, for: indexPath) as? TableViewCell
        cell?.toDoLabel.text = presenter.getItemName(at:indexPath.row) 
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

extension HomeViewController: EditToDoViewControllerDelegate {
    func getEditedItem(at row: Int,_ task: Task) {
        presenter.editItem(at: row, task)
        self.tableView.reloadData()
    }
}
