import UIKit

let mediaDouble: Double = 6.0

switch mediaDouble {
case 0.0...5.99:
    print("Reprovado.")
case 6.0...10.0:
    print("Você foi aprovado")
default:
    print("Valor inválido. Vcoê inseriou um valor inválido.")
}


let mediaInt: Int = 4

switch mediaInt {
case 0:
    print("Estude...")
case 1...5:
    print("abaixo da média")
case 4:
    print("abaixo da média: 4")
case 6...10:
    print("aprovado!")
default:
    print("vc não informou uma nota")
}

enum Aluno {
    case Joao
    case Maria
    case Renato
}

var aluno = Aluno.Joao
aluno = Aluno.Renato
print(aluno)

switch aluno {
case .Joao:
    print("João")
default:
    print("Aluno não incluído")
}

enum HTTPStatusCodes: Int {
    case OK = 200
    case CREATED = 201
    case INTERNAL_SERVER_ERROR = 500
}

print("\(HTTPStatusCodes.OK): \(HTTPStatusCodes.OK.rawValue)")

enum StateView {
    case Loading
    case Success
    case Error
}

// Tratativa de estado da Tela!!!! Muito importante!!!
// ViewController...
let stateView = StateView.Loading

switch stateView {
case .Loading:
    print("Carregando...")
case .Success:
    print("Recurso recuperado com sucesso...")
case .Error:
    print("ERRO ao recuperar recurso!")
}


// Aplicacao: ViewController
enum Strings: String {
    case titleButton = "Button name"
    case titleLabel = "Title name"
}

let button = UIButton()
button.setTitle(Strings.titleButton.rawValue, for: .normal)

let label = UILabel()
label.text = Strings.titleButton.rawValue


/*
 aplicação baseadas em tabs...
 ao inves de passar explicitamente o numero,
 usa-se enums
 
 Torna o código muito legível
*/
enum Page: Int {
    // atribuição implícita
    case one = 1, two, three, four, five
    
    func getPage() -> Int { self.rawValue }
}

var pageNumber = Page.four

print(pageNumber, pageNumber.getPage())

enum View: Int {
    case Home = 1, Favorite, Buy, about
    
    func getPage() -> Int { self.rawValue }
}

var pagNumber = View.Home
print(pagNumber.getPage())


// arquivos de string em projetos internacionais, pesquisar!
enum BankDeposit {
    case inValue(Int)
    case inCheck(Bool)
}

func makeDeposit(_ values: BankDeposit) {
    switch values {
    case .inValue(let value):
        print("O valor passado é: \(value)")
    case .inCheck(let isCheck):
        print("In check: \(isCheck)")
    }
}

let deposit = BankDeposit.inValue(400)

makeDeposit(deposit)
