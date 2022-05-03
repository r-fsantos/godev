//
//  ViewController.swift
//  aula_06_01
//
//  Created by Renato F. dos Santos Jr on 14/03/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//extension ViewController: UITableViewController {
//
//}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "Cell Title"
        cell.detailTextLabel?.text = "Lorem Ipsum, etcetera. Renato Felicio dos Santos Junior"
        
        //cell.imageView?.image = UIImage(systemName:"global")
        //
        return cell
    }
}
