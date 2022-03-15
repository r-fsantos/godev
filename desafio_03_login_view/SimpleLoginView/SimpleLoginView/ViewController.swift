//
//  ViewController.swift
//  SimpleLoginView
//
//  Created by Renato F. dos Santos Jr on 14/03/22.
//

import UIKit

enum AuthenticationState {
    case invalidCredentials(errorMessage: String)
    case valid(feedbackMessage: String)
}

class ViewController: UIViewController {
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var authenticateButton: UIButton!

    @IBAction func authentication(_ sender: UIButton) {
        let email = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let errorMessage = "Erro"
        
        if let invalidEmailInfo = isEmailValid(email) {
            presenting(createAlertController(.invalidCredentials(errorMessage: invalidEmailInfo.detail), errorMessage))
        }
        
        if let invalidPasswordInfo = isPasswordValid(password) {
            presenting(createAlertController(.invalidCredentials(errorMessage: invalidPasswordInfo.detail), errorMessage))
        }

        presenting(createAlertController(.valid(feedbackMessage: "Credenciais Corretas"), "Sucesso"))
    }

    private func createAlertController(_ state: AuthenticationState,
                                       _ title: String) -> UIAlertController {
        let actionTitle = "OK"

        switch state {
        case .invalidCredentials(let errorMessage):
            let alert = UIAlertController(title: title,
                                          message: errorMessage,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: nil))
            return alert
        case .valid(let feedbackMessage):
            let alert = UIAlertController(title: title,
                                          message: feedbackMessage,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: title, style: .default, handler: nil))
            return alert
        }
    }
    
    private func presenting(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
    private func isEmailValid(_ email: String) -> EmailInfo? {
        EmailFormatter(email).isValid()
    }
    
    private func isPasswordValid(_ password: String) -> PasswordInfo? {
        PasswordFormatter(password).isValid()
    }
}
