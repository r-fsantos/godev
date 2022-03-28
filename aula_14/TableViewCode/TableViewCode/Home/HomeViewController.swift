//
//  ViewController.swift
//  TableViewCode
//
//  Created by Renato F. dos Santos Jr on 24/03/22.
//

import UIKit
import Kingfisher

final class HomeViewController: UIViewController {

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()
    
    lazy var respositories = Repository(totalCount: 0, incompleteResults: false, items: []) {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // TODO: Isolate to a method
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let addButton = UIBarButtonItem(image: UIImage.init(systemName: "house"), style: .plain, target: self, action: #selector(callSecondView))
        
        // adicionar
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    @objc func callSecondView() {
        let secondViewController = SecondViewController()
        
        secondViewController.idProduct = "ID Produto"
        
        navigationController?.present(secondViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Create a configuration method for this
        title = "Repositorios"
    
        view.backgroundColor = .orange
        
        // TODO: Please move to a new method in case need more aditions
        view.addSubview(tableView)
        
        // TODO: Create a method to add constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
        // get Swift Repos
        getInitialRepositories() // TODO: Based on this lifecycle will update just one time?
    }
    
    private func getInitialRepositories() {
        Service.shared.getRepositories { response in
            switch response {
            case .success(let repositories):
                self.respositories = repositories
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {       
        // para chamar? Apresentacao? -> Presenter (belongs to NavContr
        let secondViewController = SecondViewController()

        if let _ = navigationController {
        navigationController?.pushViewController(secondViewController, animated: true)
        } else {
            present(secondViewController, animated: true)
        }
    }

}

extension HomeViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//             return 130
//         }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        respositories.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        // TODO: Can move out to cell or EXTENSION in case of image thinking about this ;)
        let repository = self.respositories.items[indexPath.row]
        
        cell.descritionLabel.text = repository.itemDescription
        cell.titleLabel.text = repository.name
        
        
//        let url = URL(string: repository.owner.avatarURL)!
//        let processor = DownsamplingImageProcessor(size: cell.iconImageView.bounds.size) |> RoundCornerImageProcessor(cornerRadius: 20)
//        
//        cell.iconImageView.kf.indicatorType = .activity
//        cell.iconImageView.kf.setImage(with: url, placeholder: nil, options: [.processor(processor),
//                                                                              .cacheOriginalImage]) { result in
//            switch result {
//            case let .success(image):
//                DispatchQueue.main.async {
//                    cell.iconImageView.image = image.image
//                }
//            case .failure:
//                print("deu ruim")
//            }
//        }
        return cell
    }
}
