//
//  NetworkAPIService.swift
//  UnitTestDemo
//
//  Created by Pawan Agrahari on 21/05/24.
//

import Foundation

class NetworkAPIService: APIService {
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        // Here you would make a real network request
        let url = URL(string: "https://api.example.com/users")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data!)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
