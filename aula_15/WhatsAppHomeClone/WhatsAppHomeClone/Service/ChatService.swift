//
//  ChatService.swift
//  WhatsAppHomeClone
//
//  Created by Renato F. dos Santos Jr on 25/03/22.
//

import Foundation
import Alamofire

enum ChatError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
    case requestError
}

protocol ServiceProtocol {
    func getChats(completion: @escaping(Result<Chats, ChatError>) -> Void)
}


class ChatService: ServiceProtocol {
    
    let url = "https://run.mocky.io/v3/06f96957-217f-41b6-b5a3-1d922d74b7b6"
    
    static var shared: ChatService {
        let instance = ChatService()
        return instance
    }
    
    /// Injetar dependencia de Cliente Http
    /// init(....)
    
    func getChats(completion: @escaping(Result<Chats, ChatError>) -> Void) {
        // refactor to -> requestBuilder
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid))}
        
        // abstract this one to a method inside of HttpGetClient
        AF.request(url, method: .get).validate().responseDecodable(of: Chats.self) { response in
            
            switch response.result {
            case let .success(chat):
                completion(.success(chat))
            case let .failure(error): // TODO: Mapping errors
                print(error.localizedDescription)
                completion(.failure(.noProcessData))
            }
        }
    }
}

