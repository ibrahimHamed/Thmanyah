//
//  SearchRepositoryTests.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import XCTest
@testable import Thmanyah

final class SearchRepositoryTests: XCTestCase {

    private var mockService: MockSearchAPIService!
    private var repository: SearchRepository!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockService = MockSearchAPIService()
        mockService.dtoToReturn = SearchDTO(sections: []) // Safe default
        repository = SearchRepository(service: mockService)
    }

    override func tearDownWithError() throws {
        mockService = nil
        repository = nil
        try super.tearDownWithError()
    }

    func test_search_success_mapsDTO() async throws {
        // Arrange
        mockService.dtoToReturn = SearchDTO(sections: [])

        // Act
        let result = try await repository.search(with: "swift")

        // Assert
        XCTAssertEqual(result.sections.count, 0)
    }

    func test_search_failure_throwsError() async {
        // Arrange
        mockService.errorToThrow = URLError(.cannotFindHost)

        // Act & Assert
        do {
            _ = try await repository.search(with: "fail")
            XCTFail("Expected to throw")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}
