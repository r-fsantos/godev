import UIKit

// MARK - First Version of email validation

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

// MARK - Set of tests

let emailCandidates: [String] = ["test@email.com", "notEmail", "1234567890", "@email", "@email.com", "notEmail!email.com", "notEmail.com"]


let result: [String] = emailCandidates.filter(isValidEmail(_:))

//print(result)

// MARK - Implementing the Extension

extension String {
    func isEmailValid() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

        return emailPred.evaluate(with: self)
    }
}


// MARK - Evaluating extension

//let finalResult: [String] = emailCandidates.filter(isValidEmail(_:))
//print(finalResult)


typealias EmailInfo = (valid: Bool, detail: String)

struct Email {
    let email: String
    let success: String = "Email Correto"
    let empty: String = "O Email precisa ser preenchido!"
    let invalid: String = "O formato de E-mail é inválido!"
    
    init(_ email: String) {
        self.email = email
    }
    
    private func isEmpty() ->  Bool { self.email.isEmpty }
    
    private func isFormatValid() -> Bool { self.email.isEmailValid() }
    
    func validation() -> EmailInfo {
        switch self.email {
        case _ where isEmpty():
            return (valid: false, detail: self.empty)
        case _ where !isFormatValid():
            return (valid: false, detail: self.invalid)
        default:
            return (valid: true, detail: self.success)
        }
    }
}

let email: Email = Email("test@email.com")
print(email.validation())



//func emailValidation(_ email: String) -> (emailInfo) {
//    switch email {
//    case .isEmpty:
//        return (valid: false, detail: validationLookup.empty)
//    }
//}
