//
//  ChatViewModelTest.swift
//  ChatApp
//
//  Created by Hung Nguyen on 12/11/16.
//  Copyright © 2016 Hung Nguyen. All rights reserved.
//

import XCTest
@testable import ChatApp

class ChatViewModelTest: XCTestCase {
    
    var sut: ChatViewModel!
    
    override func setUp() {
        super.setUp()
        
        sut = ChatViewModel()
    }

    func test_Message_ShouldNotNill() {
        
        XCTAssertNotNil(sut.messages)
        
    }
    
    func test_AddMessage_ShouldSetMessage() {
        
        let expectaion = expectation(description: "wait message")
        sut.addMessage(withId: "1", name: "hung", text: "text") { _ in
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertEqual(sut.messages.count, 2)
    }
}
