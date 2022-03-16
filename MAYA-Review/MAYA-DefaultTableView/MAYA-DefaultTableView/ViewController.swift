//
//  ViewController.swift
//  MAYA-DefaultTableView
//
//  Created by Renato F. dos Santos Jr on 16/03/22.
//

import UIKit

struct User {
    var name: String
}

struct DataSource {
    static let users: [User] = [User(name: "Renato F S Júnior"),
                         User(name: "Renato F S"),
                         User(name: "Tarcília Gomes S"),
                         User(name: "João Vitor de O S"),
                         User(name: "Joselia de O S")]
}

enum TableViewCell: String {
case identifier = "Cell"
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
    }

    private func delegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataSource.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier.rawValue,
                                                 for: indexPath)
        cell.textLabel?.text = DataSource.users[indexPath.row].name
        
        return cell
    }

}
