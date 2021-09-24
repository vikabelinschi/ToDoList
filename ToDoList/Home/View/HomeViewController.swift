//
//  HomeViewController.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit

protocol HomeView: AnyObject {
    func onItemsRetrieval()
}

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private var tableView: UITableView!
    lazy var presenter = HomePresenterImp(with: self)
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
        let createViewController = CreateToDoViewController(nibName: createToDoViewController, bundle: nil)
        navigationController?.pushViewController(createViewController, animated: true)
    }
}

extension UIView {
    static let tableViewCell = String(describing: TableViewCell.self)
}

extension HomeViewController: HomeView {
    
    func onItemsRetrieval() {
        self.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIView.tableViewCell, for: indexPath) as? TableViewCell
        cell?.toDoLabel?.text = presenter.getItem(indexPath.row)
        return cell ?? UITableViewCell()
    }
}
