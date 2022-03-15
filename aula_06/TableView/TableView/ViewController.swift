//
//  ViewController.swift
//  TableView
//
//  Created by Renato F. dos Santos Jr on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
    }
    private func delegate() {
        // controla funcoes especificas da tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    /*
     Controlar funções específicas da TableView
     */
}

// Controlar os dados INOUT da TableView
extension ViewController: UITableViewDataSource {
    // Quantas colunas tera minha TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        cell.textLabel?.text = "Cell Title"
        cell.detailTextLabel?.text = "Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, Some Content, "
        
        return cell
    }
}

