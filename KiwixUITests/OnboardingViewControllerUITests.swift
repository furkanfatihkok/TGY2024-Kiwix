//
//  OnboardingViewControllerUITests.swift
//  KiwixUITests
//
//  Created by FFK on 14.06.2024.
//

import XCTest

class OnboardingViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testGetStartedButton() throws {
        let onboardingView = app.otherElements["OnboardingViewController"]
        XCTAssertTrue(onboardingView.waitForExistence(timeout: 1), "OnboardingViewController bulunamadı veya yüklenmedi")
    }
}

