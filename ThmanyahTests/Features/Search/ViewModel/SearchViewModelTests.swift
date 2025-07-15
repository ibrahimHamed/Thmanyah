//
//  SearchViewModelTests.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import XCTest
import Combine
@testable import Thmanyah

@MainActor
final class SearchViewModelTests: XCTestCase {
    
    private var mockUseCase: MockSearchUseCase!
    private var viewModel: SearchViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockUseCase = MockSearchUseCase()
        mockUseCase.resultToReturn = Search(sections: [])
        viewModel = SearchViewModel(useCase: mockUseCase)
    }

    override func tearDownWithError() throws {
        mockUseCase = nil
        viewModel = nil
        try super.tearDownWithError()
    }

    func test_search_success_setsResult() async throws {
        // Arrange
        mockUseCase.resultToReturn = Search(sections: [
            .init(name: "Section", type: .bigSquare, contentType: .audioArticle, order: 1, content: [])
        ])

        // Act
        await viewModel.search(word: "test")

        // Assert
        XCTAssertEqual(viewModel.searchResult?.sections.count, 1)
        XCTAssertNil(viewModel.error)
        XCTAssertFalse(viewModel.isLoading)
    }

    func test_search_failure_setsError() async {
        // Arrange
        mockUseCase.errorToThrow = URLError(.timedOut)

        // Act
        await viewModel.search(word: "fail")

        // Assert
        XCTAssertNotNil(viewModel.error)
        XCTAssertNil(viewModel.searchResult)
        XCTAssertFalse(viewModel.isLoading)
    }

    func test_targetWordDebouncedTriggersSearch() async {
        // Arrange
        mockUseCase.resultToReturn = Search(sections: [
            .init(name: "Section", type: .bigSquare, contentType: .audioArticle, order: 1, content: [])
        ])

        // Act
        viewModel.targetWord = "Swift"
        try? await Task.sleep(nanoseconds: 500_000_000) // wait for debounce

        // Assert
        XCTAssertEqual(mockUseCase.callCount, 1)
    }

    func test_emptyTargetWord_clearsResultsAndError() async {
        // Arrange
        viewModel.targetWord = "text"
        try? await Task.sleep(nanoseconds: 300_000_000)

        // Act
        viewModel.targetWord = ""
        try? await Task.sleep(nanoseconds: 300_000_000)

        // Assert
        XCTAssertNil(viewModel.searchResult)
        XCTAssertNil(viewModel.error)
    }
}
