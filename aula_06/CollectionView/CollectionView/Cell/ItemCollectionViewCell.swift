//
//  ItemCollectionViewCell.swift
//  CollectionView
//
//  Created by Renato F. dos Santos Jr on 16/03/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageLogo: UIImageView!
    
    static let identifier = "ItemCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
          
    }
    
    func setup(image: String) {
        if let image = UIImage(named: image) {
            imageLogo.image = image
        }
    }

}
