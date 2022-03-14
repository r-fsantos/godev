//: [Previous](@previous)

import Foundation

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

print(EmailFormatValidation("test@email.com").formatValidation())
print(EmailFormatValidation("notEmail").formatValidation())
print(EmailFormatValidation("1234567890").formatValidation())
print(EmailFormatValidation( "@email").formatValidation())

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

