//
//  EmailFormatValidation.swift
//  SimpleLoginView
//
//  Created by Renato F. dos Santos Jr on 14/03/22.
//

import Foundation

typealias EmailInfo = (valid: Bool, detail: String)

struct EmailFormatter {
    
    private let email: String
    private let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    enum FormatValidationMessages: String {
        case empty = "O Email precisa ser preenchido!"
        case invalid = "O formato de E-mail é inválido!"
    }
    
    init(_ email: String) {
        self.email = email
    }
    
    private func isRegexValid() -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isEmpty() -> Bool { email.isEmpty }
    
    func isValid() -> EmailInfo? {
        switch email {
        case _ where isEmpty():
            return (valid: false, detail: FormatValidationMessages.empty.rawValue)
        case _ where !isRegexValid():
            return (valid: false, detail: FormatValidationMessages.invalid.rawValue)
        default:
            return nil
        }
    }
}
