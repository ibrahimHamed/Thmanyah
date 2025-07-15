//
//  URLSessionNetworkServiceTests.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//

import XCTest
@testable import NetworkLayer

final class URLSessionNetworkServiceTests: XCTestCase {

    var sut: URLSessionNetworkService!
    var mockLogger: MockNetworkLogger!

    override func setUp() {
        super.setUp()
        mockLogger = MockNetworkLogger()
        let session = makeMockSession()
        sut = URLSessionNetworkService(session: session, logger: mockLogger)
    }

    override func tearDown() {
        sut = nil
        mockLogger = nil
        MockURLProtocol.stubData = nil
        MockURLProtocol.stubResponse = nil
        MockURLProtocol.stubError = nil
        super.tearDown()
    }

    private func makeMockSession() -> URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: config)
    }

    func test_request_decodableResponse_successfullyDecodesModel() async throws {
        // Arrange
        let expected = TestUser(id: 1, name: "Swift")
        
        let data: Data
        do {
            data = try JSONEncoder().encode(expected)
        } catch {
            XCTFail("Failed to encode TestUser: \(error)")
            return
        }

        let response = HTTPURLResponse(
            url: URL(string: "https://api.example.com/test")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )!

        MockURLProtocol.stubData = data
        MockURLProtocol.stubResponse = response

        let request = TestNetworkRequest()

        // Act
        let result: TestUser = try await sut.request(request, decodeTo: TestUser.self)

        // Assert
        XCTAssertEqual(result, expected)
        XCTAssertTrue(mockLogger.loggedMessages.contains("✅ Decoded TestUser successfully."))
    }

    func test_request_decodableResponse_failsWithDecodingError() async {
        // Arrange
        MockURLProtocol.stubData = Data("invalid json".utf8)
        MockURLProtocol.stubResponse = HTTPURLResponse(
            url: URL(string: "https://api.example.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        let request = TestNetworkRequest()

        // Act & Assert
        do {
            _ = try await sut.request(request, decodeTo: TestUser.self)
            XCTFail("Expected decoding error")
        } catch {
            XCTAssertTrue(mockLogger.loggedMessages.contains(where: {
                $0.contains("🧨 Decode error (TestUser):") || $0.contains("🧨 Decode failed for TestUser:")
            }))
        }
    }

    func test_cancelAllRequests_logsCancellation() {
        // Act
        sut.cancelAllRequests()

        // Assert
        XCTAssertTrue(mockLogger.loggedMessages.contains("🔌 Cancelled all requests."))
    }
}
