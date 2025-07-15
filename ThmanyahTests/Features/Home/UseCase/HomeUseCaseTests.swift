//
//  HomeUseCaseTests.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import XCTest
@testable import Thmanyah

final class HomeUseCaseTests: XCTestCase {

    private var mockRepo: MockHomeRepository!
    private var useCase: HomeUseCase!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRepo = MockHomeRepository()
        mockRepo.homeToReturn = Home(sections: [], pagination: Pagination(nextPage: nil, totalPages: 1))
        useCase = HomeUseCase(repository: mockRepo)
    }

    override func tearDownWithError() throws {
        mockRepo = nil
        useCase = nil
        try super.tearDownWithError()
    }

    func test_fetchHome_success_returnsHome() async throws {
        // Act
        let result = try await useCase.fetchHome(page: 1)

        // Assert
        XCTAssertEqual(result.pagination?.totalPages, 1)
        XCTAssertTrue(result.sections.isEmpty)
    }

    func test_fetchHome_failure_throwsError() async {
        // Arrange
        mockRepo.errorToThrow = URLError(.notConnectedToInternet)

        // Act & Assert
        do {
            _ = try await useCase.fetchHome(page: 1)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}
