//
//  SearchScreenUITests.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 15/07/2025.
//
import XCTest

final class SearchScreenUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func test_searchIcon_tapsAndNavigatesToSearchScreen() {
        app.buttons["searchIcon"].tap()

        let placeholder = app.staticTexts["Start typing to search."]
        XCTAssertTrue(placeholder.waitForExistence(timeout: 5))
    }
}
