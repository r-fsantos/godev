/*
 Programação Funcional
 
 paradigmas seguem/implementam MoCs (Models of Computation).
 Swift possui suporte ao paradigma.
 - map, filter, reduce.
 - Funções são cidadãos de primeira classe: tão importante quanto variávies:
    - podem ser passadas para funções
 - Funções anônimas/lambdas/blocks...?

*/

var students = ["Renato", "Samuel", "Matheus", "Ana", "Bernardo", "Joao"]

/*
 lhs = left hand side
 rhs = right hand side
*/

students.sort { (lhs: String, rhs: String) -> Bool in
    lhs > rhs  // Decrecent
}
print(students)
//print(students.sorted())
                
let descending = students.sorted(by: >)
print(descending)

let ascending = students.sorted(by: <)
print(ascending)

// array1 + array2 = [all_elements_of_array1 + all_elements_of_array2]

/*
 Map -> Mapeia todos os elementos de um array, aplicando-os a função e produz um array de mesmo tamanho com os resultados.
*/

var alunosNota = [4, 5, 7, 6, 3]
print(alunosNota)
var notasCorrigidas: [Int] = []

for nota in alunosNota {
    let novaNota = nota + 1
    notasCorrigidas.append(novaNota)
}
print(notasCorrigidas)

//func corrigeNotas(nota: Int) -> Int {
//    nota + 1
//}

alunosNota = alunosNota.map({ res in
    res + 1
}) // ou
print(alunosNota)

let newAlunosNota: [Int] = alunosNota.map { $0 + 1 }
print(alunosNota)
print(newAlunosNota)


/*
 Filter -> Semelhante ao amp, aplica cada elemento de um iterável uma função.
 Porém filtra os elementos, de acordo com algum criterio. Também produz uma lista
 com os elementos filtrados.
 */

//var aprovadosNotas: [Int] = []

//for nota in newAlunosNota {
//    if nota >= 6 { aprovadosNotas.append(nota)}
//}

let aprovadosNotas: [Int] = newAlunosNota.filter({ res in res >= 6 })
print(aprovadosNotas)

let compactAprovadosNotas: [Int] = newAlunosNota.filter({ $0 >= 6 })

/*
 Reduce -> Produz um retorno único, obtido através da coleção passada.
*/
let soma: Int
var notas: [Int] = [1, 2, 3, 4, 5]

//soma = notas.reduce(0, { $0 + $1 })
soma = notas.reduce(0, +)

print(soma)

// criar uma func que filtre, dentro de um array, palindromos!
