//
//  ViewController.swift
//  CollectionView
//
//  Created by Renato F. dos Santos Jr on 16/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!

    let times: [String] = ["fluminense",
                           "man-untd",
                           "fluminense",
                           "man-untd",
                           "fluminense",
                           "man-untd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
    }
    
    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
        
        registerCell()
        collectionLayout()
        
//        collection.showsHorizontalScrollIndicator = false
    }
    
    private func registerCell() {
        let nib = UINib(nibName: ItemCollectionViewCell.identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.scrollDirection = .horizontal
        
        /*
         Para imitar o scroll dos stories do insta:
         - remover a constraint do bottom, setar a celula para um tamanho definido!
         - See the magic happens
         */
        
        collection.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        times.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier,
                                                            for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell()}
        
//        cell.contentView.backgroundColor = .systemBlue
        
        let time = times[indexPath.row]
        
        cell.setup(image: time)

        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
