//
//  CategoriasViewController.swift
//  tabBarCustomView
//
//  Created by Renato F. dos Santos Jr on 17/03/22.
//

import UIKit

class CategoriasViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Categorias"
        
        delegates()
    }
    
    func delegates() {
        collection.delegate = self
        collection.dataSource = self
        
        registerCell()
        collectionLayout()
    }
    
    func registerCell() {
        let nib = UINib(nibName: CategoriasCollectionViewCell.identifier,
                        bundle: nil)
        collection.register(nib,
                            forCellWithReuseIdentifier: CategoriasCollectionViewCell.identifier)
    }
    
    func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: view.frame.size.width / 2 - 6, height: 124)
        layout.minimumLineSpacing = 10
        
        collection.collectionViewLayout = layout
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CategoriasViewController: UICollectionViewDelegate {
    
}

extension CategoriasViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CategoriasDataSource.cidades.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriasCollectionViewCell.identifier,
                                                            for: indexPath) as? CategoriasCollectionViewCell else { return UICollectionViewCell () }
        
        let cidade = CategoriasDataSource.cidades[indexPath.row]
        
        cell.setup(image: cidade.image,
                   name: cidade.name)
        
        return cell
    }
    
    
}
