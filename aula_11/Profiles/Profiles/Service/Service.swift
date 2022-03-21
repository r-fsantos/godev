//
//  Service.swift
//  Profiles
//
//  Created by Renato F. dos Santos Jr on 21/03/22.
//

import Foundation

enum UserError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
}

protocol ServiceProtocol {
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void)
}

class Service: ServiceProtocol {
    
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    static var shared: Service {
        let instance = Service()
        return instance
    }
    
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void) {
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid))}
        
        let dataTask = session.dataTask(with: url) { data, _, _ in
            do {
                guard let jsonData = data else { return  completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                
                let userResponse = try decoder.decode([User].self, from: jsonData)
                
                completion(.success(userResponse))
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()        
    }
    
}
