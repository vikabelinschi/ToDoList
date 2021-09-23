//
//  ViewController.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    @IBOutlet var tableView: UITableView!
    lazy var presenter = Presenter(with: self)
    var items: [String] = []
    
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
        presenter.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        //  btn.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
    }
}

extension ViewController: PresenterView {
    
    func onItemsRetrieval(items: [String]) {
        print("View recieves the result from the Presenter.")
        self.items = items
        self.tableView.reloadData()
        print(items)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.toDo?.text = items[indexPath.row]
        return cell
    }
}
