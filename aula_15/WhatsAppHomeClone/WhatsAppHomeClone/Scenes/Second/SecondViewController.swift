//
//  SecondViewController.swift
//  WhatsAppHomeClone
//
//  Created by Renato F. dos Santos Jr on 25/03/22.
//

import UIKit

class SecondViewController: UIViewController {

    // TODO: Make this "component" reusable
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Avisa ai que deu bom!")

        view.backgroundColor = .lightGray

        view.addSubview(closeButton)

        NSLayoutConstraint.activate([
            // TODO: Add those constants to Metrics file
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc func closeModal() {
        dismiss(animated: true) {
            print("Fim da transição na SecondViewController")
        }
    }

}
