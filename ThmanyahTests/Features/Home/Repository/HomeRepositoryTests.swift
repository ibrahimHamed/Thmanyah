//
//  HomeRepositoryTests.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import XCTest
@testable import Thmanyah

final class HomeRepositoryTests: XCTestCase {

    private var mockService: MockHomeAPIService!
    private var repository: HomeRepository!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockService = MockHomeAPIService()
        mockService.dtoToReturn = HomeMockFactory.makeMockHomeDTO()
        repository = HomeRepository(service: mockService)
    }

    override func tearDownWithError() throws {
        mockService = nil
        repository = nil
        try super.tearDownWithError()
    }

    func test_fetchHome_success_validDTO_mapsToCorrectDomainModel() async throws {
        // Act
        let result = try await repository.fetchHome(page: 1)

        // Assert
        XCTAssertEqual(result.pagination?.totalPages, 10)
        XCTAssertEqual(result.sections.count, 1)
        XCTAssertEqual(result.sections[0].content[0].name, "content-1")
    }

    func test_fetchHome_sectionWithoutContent() async throws {
        // Arrange
        mockService.dtoToReturn = HomeMockFactory.makeMinimalHomeDTO()

        // Act
        let result = try await repository.fetchHome(page: 1)

        // Assert
        XCTAssertTrue(result.sections[0].content.isEmpty)
    }

    func test_fetchHome_emptyDTO_returnsDefaultPaginationAndEmptySections() async throws {
        // Arrange
        mockService.dtoToReturn = HomeDTO(sections: nil, pagination: nil)

        // Act
        let result = try await repository.fetchHome(page: 1)

        // Assert
        XCTAssertNil(result.pagination?.totalPages)
        XCTAssertTrue(result.sections.isEmpty)
    }

    func test_fetchHome_propagatesServiceError() async throws {
        // Arrange
        mockService.errorToThrow = URLError(.badURL)

        // Act & Assert
        do {
            _ = try await repository.fetchHome(page: 1)
            XCTFail("Expected fetchHome to throw, but it succeeded.")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}
