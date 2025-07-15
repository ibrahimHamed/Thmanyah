//
//  HomeViewModelTests.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import XCTest
@testable import Thmanyah

@MainActor
final class HomeViewModelTests: XCTestCase {

    private var mockUseCase: MockHomeUseCase!
    private var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockUseCase = MockHomeUseCase()
        mockUseCase.homeToReturn = Home(
            sections: [.init(name: "", type: nil, contentType: nil, order: 0, content: [])],
            pagination: Pagination(nextPage: nil, totalPages: 10)
        )
        viewModel = HomeViewModel(useCase: mockUseCase)
    }

    override func tearDownWithError() throws {
        mockUseCase = nil
        viewModel = nil
        try super.tearDownWithError()
    }

    func test_fetchHome_success_setsHomeAndStopsLoading() async {
        await viewModel.fetchHome()
        try? await Task.sleep(nanoseconds: 100_000_000)

        XCTAssertEqual(viewModel.home?.sections.count, 1)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.error)
    }

    func test_fetchHome_failure_setsError() async {
        mockUseCase.errorToThrow = URLError(.badServerResponse)

        await viewModel.fetchHome()
        try? await Task.sleep(nanoseconds: 100_000_000)

        XCTAssertNotNil(viewModel.error)
        XCTAssertFalse(viewModel.isLoading)
    }

    func test_loadNextPage_appendsSections() async {
        let section1 = CommonSection(name: "s1", type: nil, contentType: nil, order: 1, content: [])
        let section2 = CommonSection(name: "s2", type: nil, contentType: nil, order: 1, content: [])
        mockUseCase.homeToReturn = Home(sections: [section1], pagination: Pagination(nextPage: nil, totalPages: 10))
        await viewModel.fetchHome()
        try? await Task.sleep(nanoseconds: 100_000_000)

        mockUseCase.homeToReturn = Home(sections: [section2], pagination: Pagination(nextPage: nil, totalPages: 10))
        await viewModel.loadNextPage()
        try? await Task.sleep(nanoseconds: 100_000_000)

        XCTAssertEqual(viewModel.home?.sections.count, 2)
        XCTAssertEqual(mockUseCase.callCount, 2)
    }

    func test_loadNextPage_stopsAtLastPage() async {
        mockUseCase.homeToReturn = Home(
            sections: [.init(name: "", type: nil, contentType: nil, order: 0, content: [])],
            pagination: Pagination(nextPage: nil, totalPages: 1)
        )
        viewModel = HomeViewModel(useCase: mockUseCase)

        await viewModel.fetchHome()
        try? await Task.sleep(nanoseconds: 100_000_000)
        await viewModel.loadNextPage()
        try? await Task.sleep(nanoseconds: 100_000_000)

        XCTAssertEqual(mockUseCase.callCount, 1)
    }

    func test_concurrentLoads_prevented() async {
        async let first: () = viewModel.fetchHome()
        async let second: () = viewModel.loadNextPage()
        _ = await (first, second)

        XCTAssertEqual(mockUseCase.callCount, 1)
    }

    func test_fetchHome_failure_showsError_andRollsBackPage() async {
        mockUseCase.homeToReturn = Home(
            sections: [.init(name: "", type: nil, contentType: nil, order: 0, content: [])],
            pagination: Pagination(nextPage: nil, totalPages: 2)
        )
        await viewModel.fetchHome()
        try? await Task.sleep(nanoseconds: 100_000_000)

        mockUseCase.errorToThrow = URLError(.badServerResponse)
        await viewModel.loadNextPage()
        try? await Task.sleep(nanoseconds: 100_000_000)

        XCTAssertNotNil(viewModel.error)
        XCTAssertEqual(mockUseCase.callCount, 2)
        XCTAssertEqual(viewModel.home?.sections.count, 1)
    }
}
