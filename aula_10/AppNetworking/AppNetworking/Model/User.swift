//
//  User.swift
//  AppNetworking
//
//  Created by Renato F. dos Santos Jr on 18/03/22.
//

import Foundation

typealias Users = [User]

// MARK: - User
struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address?
    let phone: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, city, zipcode: String
}

// MARK: - Company
struct Company: Codable {
    let name: String
}
