//
//  CustomTableViewCell.swift
//  CustomTableViewCell
//
//  Created by Renato F. dos Santos Jr on 15/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK - IBOutlet Area
    /// Step 0,
    /// Step 1: Creates a function/method to manage the content for the labels
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUp(_ logo: String, _ name: String, _ description: String) {
        
        logoImageView.image = UIImage(named: logo)
        
        nameLabel.text = name
        nameLabel.textAlignment = .justified
        nameLabel.font = .boldSystemFont(ofSize: 15)
        
        descriptionLabel.text = description

    }
}
