//
//  YrtOSUITests.swift
//  YrtOSUITests
//
//  Created by Lorenz Simon on 20.04.24.
//

import XCTest

final class AppLaunchUITest: XCTestCase {
    func testLaunchApp() throws {
        let app = XCUIApplication()
        app.launch()

        let appTray = app.menuBars.statusItems["AppTray"]
        XCTAssert(appTray.exists)
    }
}
