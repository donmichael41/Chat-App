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
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
        
        app.buttons["Let's Go"].tap()
        
        let toolbarsQuery = app.toolbars
        let newMessageTextView = toolbarsQuery.textViews["New Message"]
        newMessageTextView.tap()
        app.keys["H"].tap()
        app.keys["u"].tap()
        newMessageTextView.typeText("Hung")
        toolbarsQuery.buttons["Send"].tap()
        XCUIDevice.shared().orientation = .faceUp
        
    }
    
}
