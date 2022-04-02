//
//  ViewController.swift
//  Profiles
//
//  Created by Renato F. dos Santos Jr on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    lazy var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.collection.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        getUsers()
        registerCell()
        collectionLayout()
    }
    
    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: UserCollectionViewCell.identifier, bundle: nil)
        
        collection.register(nib, forCellWithReuseIdentifier: UserCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: view.frame.size.width, height: 90)
        
        collection.collectionViewLayout = layout
    }
    
    private func getUsers() {
        Service.shared.getUsers { result in
            switch result {
            case .success(let res):
                self.users = res
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.identifier,
                                                        for: indexPath) as? UserCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup(user: self.users[indexPath.row])
        
        return cell
    }
}

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
