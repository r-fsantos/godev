//
//  ViewController.swift
//  SimpleLoginView
//
//  Created by Renato F. dos Santos Jr on 14/03/22.
//

import UIKit

typealias EmailInfo = (valid: Bool, detail: String)
typealias PasswordInfo = (valid: Bool, detail: String)

struct EmailFormatValidation {
    
    let email: String
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    enum FormatValidationMessages: String {
        case empty = "O Email precisa ser preenchido!"
        case invalid = "O formato de E-mail é inválido!"
    }

    init(_ email: String) {
        self.email = email
    }
    
    private func isRegexValid() -> Bool {
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: self.email)
    }
    
    private func isEmpty() -> Bool { self.email.isEmpty }
    
    func formatValidation() -> EmailInfo? {
        switch self.email {
        case _ where isEmpty():
            return (valid: false, detail: FormatValidationMessages.empty.rawValue)
        case _ where !isRegexValid():
            return (valid: false, detail: FormatValidationMessages.invalid.rawValue)
        default:
            return nil
        }
    }
}

struct PasswordFormatValidation {
    
    let password: String
    
    enum FormatValidationMessages: String {
        case empty = "A senha precisa ser preenchida!"
    }
    
    init(_ password: String) {
        self.password = password
    }
    
    private func isEmpty() -> Bool { self.password.isEmpty }
    
    func formatValidation() -> PasswordInfo? {
        switch self.password {
        case _ where isEmpty():
            return (valid: false, detail: FormatValidationMessages.empty.rawValue)
        default:
            return nil
        }
    }
}

class ViewController: UIViewController {

    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var authenticateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func authentication(_ sender: UIButton) {
        let email: String = String(loginTextField.text ?? "")
        let password: String = String(passwordTextField.text ?? "")

        if let invalidEmailInfo = emailValidation(email) {
            let alert = getAlert(false, "E-mail inválido", invalidEmailInfo.detail)
            
            presenting(alert)
            
        }
        
        if let invalidPasswordInfo = passwordValidation(password) {
            let alert = getAlert(false, "Senha inválida", invalidPasswordInfo.detail)
            
            presenting(alert)
        }

        let successAlert = getAlert(true, "Login Feito com Sucesso", "Credenciais Corretas")
        
        presenting(successAlert)
    }
    
    func emailValidation(_ email: String) -> EmailInfo? {
        let email = EmailFormatValidation(email)
        
        return email.formatValidation()
    }
    
    func passwordValidation(_ password: String) -> PasswordInfo? {
        let password = PasswordFormatValidation(password)
        
        return password.formatValidation()
    }
    
    func getAlert(_ success: Bool, _ title: String, _ message: String) -> UIAlertController {
        switch success {
        case false:
            let alert = UIAlertController(title: title,
                                     message: message,
                                     preferredStyle: .alert)
            let actionTitle: String = "Tentar Novamente?!"
            alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
            
            return alert
        default:
            let alert = UIAlertController(title: title,
                                     message: message,
                                     preferredStyle: .alert)
            let actionTitle: String = "Ok"
            alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))

            return alert
        }
    }
    
    func presenting(_ alert: UIAlertController) -> Void { present(alert, animated: true, completion: nil) }
    
}

