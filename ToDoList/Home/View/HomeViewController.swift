//
//  ViewController.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit

protocol HomeView: AnyObject {
    func onItemsRetrieval(items: [String])
}


class HomeViewController: UIViewController , HomeView{
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private var tableView: UITableView!
    private lazy var presenter = HomePresenterImp(with: self)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: TableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TableViewCell.self))
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

extension HomeViewController: HomePresenter{
    
    func onItemsRetrieval(items: [String]) {
        self.tableView.reloadData()
    }
}


extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items?.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as? TableViewCell
        cell?.toDoLabel?.text = presenter.items?[indexPath.row]
        return cell ?? UITableViewCell()
    }
}
