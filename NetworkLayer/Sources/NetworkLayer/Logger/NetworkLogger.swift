//
//  NetworkLogger.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

public protocol NetworkLogger {
    func logRequest(_ request: URLRequest)
    func logResponse(data: Data?, response: URLResponse?, error: Error?)
    func log(message: String)
}

public struct DefaultNetworkLogger: NetworkLogger {
    public init() {}

    public func logRequest(_ request: URLRequest) {
        debugPrint("➡️ Request: \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")")
        if let headers = request.allHTTPHeaderFields {
            debugPrint("Headers: \(headers)")
        }
        if let body = request.httpBody, let bodyString = String(data: body, encoding: .utf8) {
            debugPrint("Body: \(bodyString)")
        }
    }

    public func logResponse(data: Data?, response: URLResponse?, error: Error?) {
        if let httpResponse = response as? HTTPURLResponse {
            debugPrint("⬅️ Response: \(httpResponse.statusCode)")
        }
        if let error = error {
            debugPrint("Error: \(error.localizedDescription)")
        }
    }

    public func log(message: String) {
        debugPrint(message)
    }
}
