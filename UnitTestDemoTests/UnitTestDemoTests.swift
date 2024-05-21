//
//  UserViewModelTests.swift
//  UnitTestDemoTests
//
//  Created by Pawan Agrahari on 21/05/24.
//

import XCTest
@testable import UnitTestDemo

final class UserViewModelTests: XCTestCase {
    
    var viewModel: UserViewModel!
    var mockService: MockAPIService!
    
    override func setUp() {
        super.setUp()
        mockService = MockAPIService()
        viewModel = UserViewModel(apiService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchUsers() {
        let expectation = self.expectation(description: "Fetch Users")
        
        viewModel.fetchUsers {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users[0].name, "User 1")
        XCTAssertEqual(viewModel.users[1].name, "User 2")
    }
}
