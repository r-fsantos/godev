//
//  HomeDataSource.swift
//  tabBarCustomView
//
//  Created by Renato F. dos Santos Jr on 16/03/22.
//

import Foundation

struct Person {
    var name: String
    var city: String
}

struct HomeDataSource {
    static let persons: [Person] = [Person(name: "Renato", city: "Brasília-DF"),
                                    Person(name: "Bruno Coelho", city: "Bruno Coelho Cidade"),
                                    Person(name: "Bruno", city: "Bruno Cidade"),
                                    Person(name: "Alison", city: "Interior de Sampa"),
                                    Person(name: "Jady", city: "Cidade Jady")]
}
