//
//  CategoriasDataSource.swift
//  tabBarCustomView
//
//  Created by Renato F. dos Santos Jr on 17/03/22.
//

import Foundation

struct Cidade {
    var image: String
    var name: String
}

struct CategoriasDataSource {
    static let cidades: [Cidade] = [.init(image: "fluminense", name: "FFC"),
                                    .init(image: "fluminense", name: "FFC"),
                                    .init(image: "fluminense", name: "FFC"),
                                    .init(image: "fluminense", name: "FFC"),
                                    .init(image: "fluminense", name: "FFC"),
                                    .init(image: "fluminense", name: "FFC"),
                                    .init(image: "fluminense", name: "FFC"),
                                    .init(image: "fluminense", name: "FFC"),]
}
