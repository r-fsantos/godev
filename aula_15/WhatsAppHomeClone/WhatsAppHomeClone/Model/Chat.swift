//
//  Chat.swift
//  WhatsAppHomeClone
//
//  Created by Renato F. dos Santos Jr on 25/03/22.
//

import Foundation

typealias Chats = [Chat]

// MARK: - Chat
struct Chat: Codable {
    let id: Int
    let name: String
    let picture: String
    let latestTimestamp, lastChat: String

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case latestTimestamp = "latest_timestamp"
        case lastChat
    }
}
