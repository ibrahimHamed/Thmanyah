//
//  HomeScreenUITests.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 15/07/2025.
//
import XCTest

final class HomeScreenUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func test_homeScreen_displaysTopPodcastsSection() {
        let topPodcastsTitle = app.staticTexts["Top Podcasts"]
        XCTAssertTrue(topPodcastsTitle.waitForExistence(timeout: 5))
    }
}
