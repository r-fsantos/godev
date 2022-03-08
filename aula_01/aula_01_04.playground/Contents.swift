/*
 Coleção de Dados - Arrays
 Coleção de dados com um ou mais elementos, do mesmo tipo,
 em uma região contígua de memória
*/

var cars: [String] = ["Fusca", "Marea Turbo", "Celta"]

cars.append("Gol")

print(cars)

cars.insert("Audi R8", at: 0)

print(cars)

cars.removeLast()

print(cars)
