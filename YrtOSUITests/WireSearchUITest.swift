//
//  WireSearchUITest.swift
//  YrtOSUITests
//
//  Created by Lorenz Simon on 01.05.24.
//

import XCTest
import YrtOS

final class WireSearchUITest: XCTestCase {
    typealias AID = AccessibilityIdentifier.ControlBarView

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        app.menuBars.statusItems["AppTray"].click()
    }

    func testTransitionToSearchField() throws {
        let searchButton = app.buttons[AID.searchShowButton]
        XCTAssert(searchButton.exists)
        XCTAssert(searchButton.isEnabled)
        searchButton.click()

        let textField = app.textFields[AID.searchTextField]
        XCTAssert(textField.exists)
        XCTAssert(!searchButton.isEnabled)
        textField.typeText("test")

        let closeButton = app.buttons[AID.searchHideButton]
        XCTAssert(closeButton.exists)
        closeButton.click()

        XCTAssert(searchButton.isEnabled)
    }
}
