//
//  FullAppUITests.swift
//  FullAppUITests
//
//  Created by juger rash on 12.05.20.
//  Copyright © 2020 juger rash. All rights reserved.
//

import XCTest
@testable import FullApp

class FullAppUITests: XCTestCase {
    
    var app : XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testChatVC_WhenAppLaunched_ChatVCDisplayed() {
        app.launch()
        XCTAssert(app.isDisplayChatVC)
    }
    
    func testSideMenuBtn_WhenTapped_SideMenuViewDisplayed() {
        app.launch()
        displayLoginVC()
        
        XCTAssert(app.isDisplayLoginVC, "Check segues identifiers")
        
    }
    
    func testExitBtn_WhenTapped_LoginVCDismissed() {
        app.launch()
        displayLoginVC()
        app.buttons[TestButtonViewIDs.ExitBtnViewID].tap()
        XCTAssert(app.isDisplaySideMenuVC)
    }
    
    func testSignupBtn_WhenTapped_CreateAccountVCDisplayed() {
        app.launch()
        displayLoginVC()
        app.buttons[TestButtonViewIDs.SignupBtnVIewID].tap()
        XCTAssert(app.isDisplayCreateAccountVC)
    }
    
    func testExitBtn_WhenTapped_UnwindSegueDisplayed() {
        app.launch()
        displayLoginVC()
        app.buttons[TestButtonViewIDs.SignupBtnVIewID].tap()
        app.buttons[TestButtonViewIDs.ExitBtnToUnwindViewID].tap()
        XCTAssert(app.isDisplaySideMenuVC)
    }
    
    func testPickAvatarBtn_WhenTapped_AvatarPickerVCDisplayed() {
        app.launch()
        
        displayLoginVC()
        
        app.buttons[TestButtonViewIDs.SignupBtnVIewID].tap()
        app.buttons[TestButtonViewIDs.PickAvatarBtnViewID].tap()
        
        XCTAssert(app.isDisplayAvatarPickerVC)
        
    }
    
    func displayLoginVC() {
        app.buttons[TestButtonViewIDs.SideMenuBtnViewID].tap()
        app.buttons[TestButtonViewIDs.LoginBtnViewID].tap()
    }
    
    
    
}


extension XCUIApplication {
    var isDisplayChatVC : Bool {
        return otherElements[TestViewIDs.ChatVCID].exists
    }
    var isDisplaySideMenuVC : Bool {
        return otherElements[TestViewIDs.SideMenuVCViewID].exists
    }
    var isDisplayLoginVC : Bool {
        return otherElements[TestViewIDs.LoginVCViewID].exists
    }
    var isDisplayCreateAccountVC : Bool {
        return otherElements[TestViewIDs.CreateAccountVCViewID].exists
    }
    var isDisplayAvatarPickerVC : Bool {
        return otherElements[TestViewIDs.AvatarPickerVCViewID].exists
    }
}
