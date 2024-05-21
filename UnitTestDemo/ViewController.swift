//
//  ViewController.swift
//  UnitTestDemo
//
//  Created by Pawan Agrahari on 21/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = UserViewModel(apiService: NetworkAPIService())
        
        viewModel.fetchUsers {
            // Update UI with fetched users
            print(self.viewModel.users)
        }
    }
}
