//
//  MockNetworkLogger.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation
@testable import NetworkLayer

final class MockNetworkLogger: NetworkLogger {
    var loggedMessages: [String] = []

    func log(message: String) {
        loggedMessages.append(message)
    }

    func logRequest(_ request: URLRequest) {
        log(message: "➡️ \(request.url?.absoluteString ?? "")")
    }

    func logResponse(data: Data?, response: URLResponse?, error: Error?) {
        if let httpResponse = response as? HTTPURLResponse {
            log(message: "⬅️ \(httpResponse.statusCode)")
        }
    }
}
