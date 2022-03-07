import UIKit

var firstName: String = "Renato"
print(firstName)

let middleName: String = "Felício"
print(middleName)

// concatenação de strings
let fullName: String = firstName + middleName
print(fullName)

// interpolação de strings

let interpolatedFullName: String = "Meu nome é: \(firstName) \(middleName)"

print(interpolatedFullName)

// inferência de tipos... o Compilador é suficientemente
// inteligente...
