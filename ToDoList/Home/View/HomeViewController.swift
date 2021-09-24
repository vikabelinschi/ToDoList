//
//  ViewController.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit

protocol HomeView: AnyObject {
    func onItemsRetrieval()
    func getNumberOfRows() -> Int
    func getItem(_ int: Int) -> String
}

class HomeViewController: UIViewController , HomeView {
    
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private var tableView: UITableView!
    private lazy var presenter = HomePresenterImp(with: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: TableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TableViewCell.self))
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension HomeViewController: HomePresenter {
    
    func onItemsRetrieval() {
        self.tableView.reloadData()
    }
    
    func getNumberOfRows() -> Int {
        return presenter.items?.count ?? 0
    }
    
    func getItem(_ int: Int) -> String {
        return presenter.items?[int] ?? ""
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as? TableViewCell
        cell?.toDoLabel?.text = getItem(indexPath.row)
        return cell ?? UITableViewCell()
    }
}
