//
//  CustomTableViewCell.swift
//  WhatsAppHomeClone
//
//  Created by Renato F. dos Santos Jr on 25/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "callEditHomeView"
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "house")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10 // espaco entre os elementos
        stack.contentMode = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Mussum Ipsum"
        label.textColor = .systemGray
        // TODO: Create a metrics file
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    lazy var descritionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mussum Ipsum, cacilds vidis litro abertis."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(iconImageView)
        NSLayoutConstraint.activate([
            // TODO: Create a metrics file
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            // TODO: Create a metrics file
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descritionLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
