//
//  SecondViewController.swift
//  TableViewCode
//
//  Created by Renato F. dos Santos Jr on 25/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func closeModal() {
//        print("closed modal")
        dismiss(animated: true) {
            print("finalizei a animacao")
        }
    }

    public var idProduct: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Second"
        view.backgroundColor = .lightGray
        
        if let idProduct = idProduct {
            print(idProduct)
        }
        
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }

}
