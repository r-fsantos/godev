//
//  ViewController.swift
//  WhatsAppHomeClone
//
//  Created by Renato F. dos Santos Jr on 25/03/22.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()
    
    lazy var chats = Chats() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Conversas"
        
        view.backgroundColor = .black
        
        view.addSubview(tableView)
        
        // TODO: Create a metrics file
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
        ])
        
        getChats()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .darkGray // TODO: Try another black color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        // MARK: NavigationController Specs
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        // MARK: NavigationController Items
        
        // TODO: Add ThirdViewController, or FourthViewController
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Editar",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(callEditHomeView))
        
        // TODO: Add Action Create a new chat, choose some folks to chat
        let button = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(callNewChatView))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func callNewChatView() {
        let secondViewController = SecondViewController()
        
        navigationController?.present(secondViewController, animated: true, completion: {
            print("Aulas & Palestras!")
        })
    }
    
    @objc func callEditHomeView() {
        let thirdViewController = ThirdViewController()
        
        navigationController?.present(thirdViewController, animated: true, completion: {
            print("Termina edição")
        })
    }
    
    func getChats() {
        ChatService.shared.getChats { response in
            switch response {
            case .success(let chats):
                self.chats = chats
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Cliquei na célula: \(indexPath.row)")
        let secondViewController = SecondViewController()

        if let _ = navigationController {
        navigationController?.pushViewController(secondViewController, animated: true)
        } else {
            present(secondViewController, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let chat = self.chats[indexPath.row]
        
        let url = URL(string: chat.picture)
        
        cell.titleLabel.text = chat.name
        cell.descritionLabel.text = chat.lastChat
        
        let processor = DownsamplingImageProcessor(size: cell.iconImageView.bounds.size) |> RoundCornerImageProcessor(cornerRadius: 20)
        
        cell.iconImageView.kf.indicatorType = .activity
        cell.iconImageView.kf.setImage(with: url,
                                       placeholder: nil,
//                                       options: nil,
                                       options: [.processor(processor),
                                                 .cacheOriginalImage],
                                       completionHandler: nil)
        return cell
    }
}

