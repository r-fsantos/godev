//
//  ProfileCollectionViewCell.swift
//  Profiles
//
//  Created by Renato F. dos Santos Jr on 21/03/22.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "UserCollectionViewCell"

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.layer.cornerRadius = 30
    }
    
    func setup(user: User) {
        nameLabel.text = user.name
        companyLabel.text = user.company.name
        photoImageView.downloaded(from: user.photo, contentMode: .scaleAspectFill)
    }
}
