//
//  CategoriasCollectionViewCell.swift
//  tabBarCustomView
//
//  Created by Renato F. dos Santos Jr on 17/03/22.
//

import UIKit

class CategoriasCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "CategoriasCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(image: String, name: String) {
        if let image = UIImage(named: image) {
            logoImageView.image = image
        }
        nameLabel.text = name
    }

}
