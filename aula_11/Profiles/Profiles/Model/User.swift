//
//  Profile.swift
//  Profiles
//
//  Created by Renato F. dos Santos Jr on 21/03/22.
//

import Foundation

// MARK: - Profile
struct User: Codable {
    let id: Int
    let name: String
    let photo: String
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
}
