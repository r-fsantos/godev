
/*
 Dicionários, coleção de pares chave-valor.
 Valores são recuperados a partir de uma dada chave
*/

var someDict: [[String: Any]] = [["name": "Renato",
                                  "email": "renato@email.com",
                                  "age": 26,
                                 ],
                                 [
                                    "name": "Felicio",
                                    "email": "felicio@gmail.com",
                                    "age": 26
                                 ]]

let emptyName: String = "Empty name"
let name = someDict[0]["name"] ?? emptyName
print(name)

print(someDict[1]["email"]!)

