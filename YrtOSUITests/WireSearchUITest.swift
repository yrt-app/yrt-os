//
//  WireSearchUITest.swift
//  YrtOSUITests
//
//  Created by Lorenz Simon on 01.05.24.
//

import XCTest

final class WireSearchUITest: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        app.menuBars.statusItems["AppTray"].click()
    }

    func testTransitionToSearchField() throws {
        let searchButton = app.buttons["Search"]
        XCTAssert(searchButton.exists)
        XCTAssert(searchButton.isEnabled)
        searchButton.click()

        let textField = app.textFields["Search"]
        XCTAssert(textField.exists)
        XCTAssert(!searchButton.isEnabled)
        textField.typeText("test")

        let closeButton = app.buttons["Close"]
        XCTAssert(closeButton.exists)
        closeButton.click()

        XCTAssert(searchButton.isEnabled)
    }
}
