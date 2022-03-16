//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Renato F. dos Santos Jr on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Times"
        
        delegates()
    }

    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cliquei no time: \(indexPath.row)")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataSource.times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
         TypeCast necessário pois `dequeueReusableCell` -> UITableViewCell.
         Porém desejo utilizar `CustomTableViewCell` <= UITableViewCell.
         Para tanto, faz-se o Cast.
         
         Uso do guard let: Programação defensiva, visando proteção contra mudanças em `CustomTableViewCell`.
         Agora o TypeCast é Optional, vez que ???
         */
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                       for: indexPath) as? CustomTableViewCell else { return UITableViewCell()  }
        
        let time: Time = DataSource.times[indexPath.row]

        
        cell.setUp(time.logo, time.name, time.description)
        
        return cell
    }
    
}

