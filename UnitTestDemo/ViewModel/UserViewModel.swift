//
//  UserViewModel.swift
//  UnitTestDemo
//
//  Created by Pawan Agrahari on 21/05/24.
//

import Foundation

class UserViewModel {
    private var apiService: APIService

    var users: [User] = []

    init(apiService: APIService) {
        self.apiService = apiService
    }

    func fetchUsers(completion: @escaping () -> Void) {
        apiService.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                print("Error fetching users: \(error)")
            }
            completion()
        }
    }
}
