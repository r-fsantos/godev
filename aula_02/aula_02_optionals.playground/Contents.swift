import UIKit

var message: String?
var anotherMessage: String?

message = "My msg"

print(message ?? "default for empty")

/*
 VALIDAÇÃO DE VALORES DO TIPO OPTIONAL
 
 - Deixa o código mais limpo, mais enxuto!
 - Ao utilizar os Optionals, é preciso validar, com as seguintes abordagens
 
 - if let: valida e o fluxo de execução continua
 - guard let: valida e em caso de erro a execução não continua
*/

// passa o optional para dentro do contexto/escopo, apenas
if let message = message { print(message) }

// alternativa mais convecional...
if anotherMessage != nil { print(anotherMessage ?? <#default value#>) } else { print("valor nil") }

// raises warning!
if let anotherMessage = anotherMessage { print(anotherMessage) }


// treinar Optionals...

// guard let
func getIcon() -> UIImage {
    
    // good uage for assets
    guard let image: UIImage = UIImage(named: "Photo") else { return UIImage(named: "Default")! } // forcing because it is default...

    return image
}

func someFunc(parameter: String?) {
    
    guard let parameter = parameter else { return }
    
    print(parameter)
}

someFunc(parameter: nil)
someFunc(parameter: "Renato")

func getUserName(name: String?, defaultValue: String) -> String {
    if let name = name {
        return name
    }Â˜
    
    return defaultValue
}

print(getUserName(name: nil, defaultValue: "Empty"))
print(getUserName(name: "Not empty name", defaultValue: "Empty"))
