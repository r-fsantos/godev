//
//  ViewController.swift
//  ViewCode
//
//  Created by Renato F. dos Santos Jr on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    var safeArea: UILayoutGuide!
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        
        icon.image = UIImage(systemName: "airplane")
        
        // habilita, via logica negativa, permissao para utilizar autolayout
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .green
        label.text = "RAAAApaaaaizzzz RaaaatinhoOooooOoOooOo\n\nUeeeeePAAAAAaaaaaaaaaaAAAAAa"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize:  13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var callButtom: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Better Call Saul", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(getView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    lazy var content: UIView = {
        let view = UIView()

        view.backgroundColor = .systemIndigo
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rê Felicio"
        
        return label
    }()
    
    @objc func getView() {
        print("Honey I'm home!!!!!")
    }
    
    @IBAction func test() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button.setTitle("My first button", for: UIControl.State.normal)
//        button.frame = CGRect(x: 100, y: 100, width: 130, height: 45)
//        button.backgroundColor = .systemIndigo
//        view.addSubview(button)  // TUDO herda de UIView..
        
        safeArea = view.layoutMarginsGuide

        title = "View Controller da Massa"
        view.backgroundColor = .grayViewCode
        
        view.addSubview(iconImageView) // auto-layout...
        view.addSubview(titleLabel)
        view.addSubview(callButtom)
        view.addSubview(content)
        
        content.addSubview(descriptionLabel)

        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            
            // se vamos colocar no centro, precio de altura e largura...
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // é preciso setar com AUTO LAYOUT
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default)
        ])
        
        NSLayoutConstraint.activate([
            callButtom.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            callButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default),
            callButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default),
            callButtom.heightAnchor.constraint(equalToConstant: 45),
        ])
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: callButtom.bottomAnchor, constant: 20),
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default),
            content.heightAnchor.constraint(equalToConstant: 130),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default),
            
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: content.centerYAnchor),
        ])
    }
}

