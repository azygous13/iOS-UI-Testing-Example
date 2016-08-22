//
//  UITestingExampleUITests.swift
//  UITestingExampleUITests
//
//  Created by Cakii on 8/22/2559 BE.
//  Copyright © 2559 Banana Coding. All rights reserved.
//

import XCTest

class UITestingExampleUITests: XCTestCase {
    
    let app = XCUIApplication()
    var tfUsername: XCUIElement!
    var tfPassword: XCUIElement!
    var btnButton: XCUIElement!
    
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        
        tfUsername = app.textFields["Username"]
        tfPassword = app.secureTextFields["Password"]
        btnButton = app.buttons["Login Button"]
    }
    
    func testUsernameAndPasswordAreEmpty() {
        tfUsername.tap()
        tfUsername.typeText("")
        tfPassword.tap()
        tfPassword.typeText("")
        btnButton.tap()
    
        XCTAssert(app.staticTexts["Error"].exists)
        XCTAssert(app.staticTexts["Username and Password cannot be empty."].exists)
    }
    
    func testUsernameIsEmpty() {
        tfUsername.tap()
        tfUsername.typeText("")
        tfPassword.tap()
        tfPassword.typeText("123456")
        btnButton.tap()
        
        XCTAssert(app.staticTexts["Error"].exists)
        XCTAssert(app.staticTexts["Username and Password cannot be empty."].exists)
    }
    
    func testPasswordIsEmpty() {
        tfUsername.tap()
        tfUsername.typeText("username")
        tfPassword.tap()
        tfPassword.typeText("")
        btnButton.tap()
        
        XCTAssert(app.staticTexts["Error"].exists)
        XCTAssert(app.staticTexts["Username and Password cannot be empty."].exists)
    }
    
    func testUsernameNotCorrect() {
        tfUsername.tap()
        tfUsername.typeText("not_exist_username")
        tfPassword.tap()
        tfPassword.typeText("123456")
        btnButton.tap()
     
        XCTAssert(app.staticTexts["Error"].exists)
        XCTAssert(app.staticTexts["Username or Password incorrect."].exists)
    }
    
    func testPasswordNotCorrect() {
        tfUsername.tap()
        tfUsername.typeText("username")
        tfPassword.tap()
        tfPassword.typeText("654321")
        btnButton.tap()
        
        XCTAssert(app.staticTexts["Error"].exists)
        XCTAssert(app.staticTexts["Username or Password incorrect."].exists)
    }

    func testUsernameAndPasswordAreCorrect() {
        tfUsername.tap()
        tfUsername.typeText("username")
        tfPassword.tap()
        tfPassword.typeText("123456")
        btnButton.tap()
        
        XCTAssert(app.staticTexts["Success"].exists)
        XCTAssert(app.staticTexts["Login successfully."].exists)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
