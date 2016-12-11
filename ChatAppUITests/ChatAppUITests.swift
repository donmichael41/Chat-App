//
//  ChatAppUITests.swift
//  ChatAppUITests
//
//  Created by Hung Nguyen on 12/7/16.
//  Copyright © 2016 Hung Nguyen. All rights reserved.
//

import XCTest

class ChatAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    
    func test_EnterShortName_ShouldNotEnableButton() {
        XCUIDevice.shared().orientation = .portrait
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        let yourNameTextField = app.textFields["Your name"]
        yourNameTextField.tap()
        
        let moreKey = app.keys["more"]
        moreKey.tap()
        moreKey.tap()
        yourNameTextField.typeText("12345")
        
        let yourButton = app.buttons["Let's Go"]
        XCTAssertFalse(yourButton.isEnabled)
    }
    
    func test_EnterEnoughName_ShouldEnableButton() {
        XCUIDevice.shared().orientation = .faceUp
        XCUIDevice.shared().orientation = .faceUp
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        let yourNameTextField = app.textFields["Your name"]
        yourNameTextField.tap()
        
        let moreKey = app.keys["more"]
        moreKey.tap()
        moreKey.tap()
        yourNameTextField.typeText("123456")
        
        let yourButton = app.buttons["Let's Go"]
        XCTAssertTrue(yourButton.isEnabled)
    }
    
    
    func test_SendMessage() {
        XCUIDevice.shared().orientation = .faceUp
        XCUIDevice.shared().orientation = .faceUp
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        let yourNameTextField = app.textFields["Your name"]
        yourNameTextField.tap()
        
        let moreKey = app.keys["more"]
        moreKey.tap()
        moreKey.tap()
        yourNameTextField.typeText("123456")
        
        app.buttons["Let's Go"].tap()
        
        let toolbarsQuery = app.toolbars
        let newMessageTextView = toolbarsQuery.textViews["New Message"]
        newMessageTextView.tap()
        app.keys["H"].tap()
        newMessageTextView.typeText("Hung")
        toolbarsQuery.buttons["Send"].tap()
        
         newMessageTextView.tap()
        newMessageTextView.typeText("Test")
        toolbarsQuery.buttons["Send"].tap()
        
        
        newMessageTextView.tap()
        newMessageTextView.typeText("Done")
        toolbarsQuery.buttons["Send"].tap()
        
        
        newMessageTextView.tap()
        newMessageTextView.typeText("Thank you")
        toolbarsQuery.buttons["Send"].tap()
    }
}
