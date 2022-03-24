//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Renato F. dos Santos Jr on 23/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        
        icon.image = UIImage(systemName: "lock.fill")
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        return icon
    }()
    
    lazy var loginLabel: UILabel = {
       let labelLogin = UILabel()
        
        labelLogin.font = UIFont.systemFont(ofSize: 15)
        labelLogin.textColor = .black
        labelLogin.text = "Login"
        labelLogin.numberOfLines = 0
        
        labelLogin.translatesAutoresizingMaskIntoConstraints = false
        
        return labelLogin
    }()
    
    lazy var loginTextField: UITextField = {
        let textLogin = UITextField()

        textLogin.font = UIFont.systemFont(ofSize: 12)
        textLogin.placeholder = "Digite seu email"
        textLogin.backgroundColor = .white
        textLogin.clearButtonMode = .whileEditing
        textLogin.clearsOnBeginEditing = true
        textLogin.translatesAutoresizingMaskIntoConstraints = false
        
        return textLogin
    }()
    
    lazy var passwordLabel: UILabel = {
        let labelPassword = UILabel()
        
        labelPassword.font = UIFont.systemFont(ofSize: 15)
        labelPassword.textColor = .black
        labelPassword.text = "Senha"
        labelPassword.numberOfLines = 0
        
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        
        return labelPassword
    }()
    
    lazy var passwordTextField: UITextField = {
        let textPassword = UITextField()
        
        textPassword.font = UIFont.systemFont(ofSize: 12)
        textPassword.placeholder = "Digite sua senha"
        textPassword.backgroundColor = .white
        textPassword.clearButtonMode = .whileEditing
        textPassword.clearsOnBeginEditing = true
        textPassword.isSecureTextEntry = true
        
        textPassword.translatesAutoresizingMaskIntoConstraints = false
        
        return textPassword
    }()
    
    lazy var authenticateButton: UIButton = {
        let buttonAuthenticate = UIButton(type: .custom)
        
        buttonAuthenticate.setTitle("Autenticar", for: .normal)
        buttonAuthenticate.backgroundColor = self.iconImageView.tintColor
        buttonAuthenticate.setTitleColor(UIColor.white, for: .normal)
        buttonAuthenticate.addTarget(self, action: #selector(authentication), for: .touchUpInside)
        buttonAuthenticate.translatesAutoresizingMaskIntoConstraints = false

        return buttonAuthenticate
    }()
    
    @objc func authentication() {
        print("Successfily authentication")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        
        title = "LoginViewCode"
        
        view.backgroundColor = .gray
        
        view.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(loginLabel)
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        view.addSubview(loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 45),
        ])
        
        view.addSubview(passwordLabel)
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 5),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
        ])
        
        view.addSubview(authenticateButton)
        NSLayoutConstraint.activate([
            authenticateButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            authenticateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authenticateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authenticateButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}
