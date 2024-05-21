//
//  MockAPIService.swift
//  UnitTestDemo
//
//  Created by Pawan Agrahari on 21/05/24.
//

import Foundation

class MockAPIService: APIService {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "MockData", ofType: "json") else {
            completion(.failure(NSError(domain: "PathError", code: 1, userInfo: nil)))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let response = try decoder.decode(MockResponse.self, from: data)
            completion(.success(response.users))
        } catch {
            completion(.failure(error))
        }
    }
}

struct MockResponse: Decodable {
    let users: [User]
}
