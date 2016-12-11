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
    
    var chatViewModel: ChatViewModel!
    
    override func setUp() {
        super.setUp()
        
        chatViewModel = ChatViewModel()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func test_Message_ShouldNotNill() {
        
        XCTAssertNotNil(chatViewModel.delegate.messages)
    }
    
    func test_AddMessage_ShouldSetMessage() {
        
        chatViewModel.addMessage(withId: "1", name: "hung", text: "text")
        
        XCTAssertEqual(chatViewModel.delegate.messages.count, 2)
        
    }
    
    func test_AddMessage_ShouldFeedbackMessage() {
        
        chatViewModel.addFeedBackMessages(name: "hung", text: "text")
        
        XCTAssertEqual(chatViewModel.delegate.messages.count, 1)
        
    }
}
