//
//  SearchUseCaseTests.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import XCTest
@testable import Thmanyah

final class SearchUseCaseTests: XCTestCase {

    private var mockRepo: MockSearchRepository!
    private var useCase: SearchUseCase!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRepo = MockSearchRepository()
        mockRepo.resultToReturn = Search(sections: []) // Safe default
        useCase = SearchUseCase(repository: mockRepo)
    }

    override func tearDownWithError() throws {
        mockRepo = nil
        useCase = nil
        try super.tearDownWithError()
    }

    func test_search_success_returnsSearch() async throws {
        // Arrange
        mockRepo.resultToReturn = Search(sections: [])

        // Act
        let result = try await useCase.search(with: "swift")

        // Assert
        XCTAssertEqual(result.sections.count, 0)
    }

    func test_search_failure_throwsError() async {
        // Arrange
        mockRepo.errorToThrow = URLError(.badServerResponse)

        // Act & Assert
        do {
            _ = try await useCase.search(with: "error")
            XCTFail("Expected to throw")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}
