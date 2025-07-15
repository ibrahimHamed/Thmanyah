//
//  MockURLProtocol.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

final class MockURLProtocol: URLProtocol {
    static var stubData: Data?
    static var stubResponse: URLResponse?
    static var stubError: Error?

    override static func canInit(with request: URLRequest) -> Bool {
        true
    }

    override static func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        if let error = Self.stubError {
            client?.urlProtocol(self, didFailWithError: error)
        } else {
            if let response = Self.stubResponse {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            if let data = Self.stubData {
                client?.urlProtocol(self, didLoad: data)
            }
            client?.urlProtocolDidFinishLoading(self)
        }
    }

    override func stopLoading() {}
}
