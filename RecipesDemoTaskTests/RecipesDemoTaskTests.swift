//
//  RecipesDemoTaskTests.swift
//  RecipesDemoTaskTests
//
//  Created by Semicolon on 21/09/2022.
//

import XCTest
@testable import RecipesDemoTask

final class RecipesDemoTaskTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testGetRecipes() {
        let expectation = expectation(description: "Waiting for API response")
        Networking.shared.getRecipes(searchWord: "all", from: 0, to: 5) { recipes, error in
            if let error = error {
                XCTFail()
                print(error.localizedDescription)
            }else{
                XCTAssertNotNil(recipes)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func testGetRecipesWithFilter() {
        let expectation = expectation(description: "Waiting for API response")
        Networking.shared.getRecipesWithFilter(searchWord: "All", health: "low-sugar", from: 0, to: 5) { recipes, error in
            if let error = error {
                XCTFail()
                print(error.localizedDescription)
            }else{
                XCTAssertNotNil(recipes)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
