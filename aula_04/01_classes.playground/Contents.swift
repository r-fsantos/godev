/*
 Classes: Definidas pensando em atributos e comportamentos.
 */


class Person {
    
    var name: String
    var lastName: String
    var age: Int
    
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }
    
    func welcome() -> Void {
        print("Seja bem-vindo, \(name) \(lastName)")
    }
}

var person1: Person = Person(name: "Renato", lastName: "Júnior", age: 26)
var person2 = person1
print(person1.name)
print(person2.name)

person1.name = "Rê"

print(person1.name)
print(person2.name)
