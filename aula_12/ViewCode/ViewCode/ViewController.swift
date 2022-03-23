//
//  ViewController.swift
//  ViewCode
//
//  Created by Renato F. dos Santos Jr on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

//    var button: UIButton = UIButton()  // necessario informar a tipagem
    var safeArea: UILayoutGuide!
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        
        icon.image = UIImage(systemName: "airplane")
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        return icon
    }() // LAZY DECLARATION
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .green
        label.text = "RAAAApaaaaizzzz RaaaatinhoOooooOoOooOo\n\nUeeeeePAAAAAaaaaaaaaaaAAAAAa"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize:  13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button.setTitle("My first button", for: UIControl.State.normal)
//        button.frame = CGRect(x: 100, y: 100, width: 130, height: 45)
//        button.backgroundColor = .systemIndigo
//        view.addSubview(button)  // TUDO herda de UIView..
        
        safeArea = view.layoutMarginsGuide

        title = "View Controller da Massa"
        view.backgroundColor = .gray
        
        view.addSubview(iconImageView) // auto-layout...
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            
            // se vamos colocar no centro, precio de altura e largura...
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // é preciso setar com AUTO LAYOUT
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
    }
    
    
}

