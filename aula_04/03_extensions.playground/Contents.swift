import UIKit

protocol Nota {
    func notaAluno()
}

protocol Materia {
    func materiaAluno()
}

class Aluno {
    var name: String?
    
    func getName() -> String {
        guard let name = name else { return "NoName" }

        return name
    }

}

extension Aluno: Nota {
    func notaAluno() {
    }
}

extension Aluno: Materia {
    func materiaAluno() {
    }
}

extension Aluno {
    func setAluno(name: String) -> Void {
        self.name = name
    }
}

var alu = Aluno()
print("opa \(alu.getName())")
