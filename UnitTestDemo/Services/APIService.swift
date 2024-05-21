//
//  APIService.swift
//  UnitTestDemo
//
//  Created by Pawan Agrahari on 21/05/24.
//

import Foundation

protocol APIService {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}
