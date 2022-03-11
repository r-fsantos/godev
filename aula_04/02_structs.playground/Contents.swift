struct Person {
    
    var name: String = "Renato"
    var lastName: String = "Júnior"
    var age: Int = 26
    
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }

    func welcome() -> Void {
        print("Seja bem-vindo, \(name) \(lastName)")
    }
}

var person1 = Person(name: "Renato", lastName: "Júnior", age: 26)
//person1.welcome()

var person2 = person1
print(person1.name)
print(person2.name)
print()

person1.name = "Rê"
print(person1.name)
print(person2.name)
