//
//  DataSource.swift
//  CustomTableViewCell
//
//  Created by Renato F. dos Santos Jr on 16/03/22.
//

import Foundation

struct Time {
    var logo: String
    var name: String
    var description: String
}

struct DataSource {
    static let times: [Time] = [
        Time(logo: "fluminense", name: "Fluminense Football Club", description: "'O Fluminense nasceu com a vocação da eternidade...tudo pode passar...só o TRICOLOR não passará jamais!' Nelson Rodrigues."),
        Time(logo: "man-untd", name: "Manchester United Football Club", description: "Theatre of Dreams!"),
    ]
}
