//
//  ChatAppTests.swift
//  ChatAppTests
//
//  Created by Hung Nguyen on 12/11/16.
//  Copyright © 2016 Hung Nguyen. All rights reserved.
//

import XCTest
@testable import ChatApp

class ChatAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var sut: LoginViewController?
        
        sut = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        _ = sut?.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
