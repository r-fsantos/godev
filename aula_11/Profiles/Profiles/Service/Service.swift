//
//  Service.swift
//  Profiles
//
//  Created by Renato F. dos Santos Jr on 21/03/22.
//

import Alamofire
import Foundation

enum UserError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
    case requestError
}

protocol ServiceProtocol {
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void)
}

class Service: ServiceProtocol {

    let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    static var shared: Service {
        let instance = Service()
        return instance
    }
    
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void) {
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid))}
  
        AF.request(url, method: .get).validate().responseDecodable(of: [User].self) { response in
            guard let users = response.value else { return completion(.failure(UserError.requestError)) }
            
            completion(.success(users))
        }
    }
}
