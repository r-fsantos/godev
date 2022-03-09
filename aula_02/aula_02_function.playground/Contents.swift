/*
 Abstrai um padrão de código repetitivo em um bloco de código reutilizável
 Ganha-se com coesão, manutenabilidade
 */


// Procedimentos
func myCar() -> Void {
    print("Meu carro")
}

func myCar(name: String?, defaultValue: String) -> Void {
    if let name = name {
        print("Meu carro é \(name)")
    
        return
    }
    print("Default value: \(defaultValue)")
}

// type alias for parameter
func myCar(name first: String) -> Void {
    print("Meu nome é: \(first)")
}


// Funções com retorno
func getName(_ name: String?, defaultValue: String) -> String {
    if let name = name { return name }
    
    return defaultValue
}

print(getName("Renato", defaultValue: "name was empty"))
print(getName(nil, defaultValue: "name was empty"))

func singleLineGetName(_ name: String) -> String { name }

print(singleLineGetName("Test Single line get name"))

typealias FullName = String

func getFullName(name: String) -> FullName { name }

print(getFullName(name: "Renato F S Júnior"))

// multiple returns
func getPerson(name: String, lastName: String) -> (String, String) {
    return (name, lastName)
}

print(getPerson(name: "Renato", lastName: "Júnior"))

let person: (String, String) = getPerson(name: "Renato", lastName: "Júnior")

print(person.0)
print(person.1)

typealias Person = (String, String)

func getPersonTypeAlias(name: String, lastName: String) -> Person {
    return (name, lastName)
}

let personPerson: Person = getPersonTypeAlias(name: "Renato", lastName: "Júnior")

print(personPerson.0)
print(personPerson.1)
