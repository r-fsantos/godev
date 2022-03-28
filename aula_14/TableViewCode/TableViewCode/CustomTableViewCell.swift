//
//  CustomTableViewCell.swift
//  TableViewCode
//
//  Created by Renato F. dos Santos Jr on 24/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(systemName: "house")
        image.contentMode = .scaleAspectFit  // testar o FILL
        image.tintColor = .purple
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
        
        label.text = "Mussum Ipsum, cacilds vidis litro abertis."
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    lazy var descritionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Mussum Ipsum, cacilds vidis litro abertis. Pra lá , depois divoltis porris, paradis.Paisis, filhis, espiritis santis.Aenean aliquam molestie leo, vitae iaculis nisl.Atirei o pau no gatis, per gatis num morreus."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    
    override class func awakeFromNib() {
        // Quando utilizamos arquivos XIB
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // testar se esta funcionando
        // debugger, deve entrar a quantidade de celulas..
        // backgroundColor = .orange // ok, next!
        
        // agora, manipular os componentes internos da nossa celula
        
        addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
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
