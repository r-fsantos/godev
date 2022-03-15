//
//  PasswordFormatValidation.swift
//  SimpleLoginView
//
//  Created by Renato F. dos Santos Jr on 14/03/22.
//

import Foundation

typealias PasswordInfo = (valid: Bool, detail: String)

struct PasswordFormatter {
    
    private let password: String
    
    enum FormatValidationMessages: String {
        case empty = "A senha precisa ser preenchida!"
    }
    
    init(_ password: String) {
        self.password = password
    }
    
    private func isEmpty() -> Bool { password.isEmpty }
    
    func isValid() -> PasswordInfo? {
        switch password {
        case _ where isEmpty():
            return (valid: false, detail: FormatValidationMessages.empty.rawValue)
        default:
            return nil
        }
    }
}
