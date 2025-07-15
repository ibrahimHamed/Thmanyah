//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingError(Error)
    case serverError(Int, Data?)
    case networkError(Error)
    case timeout
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NetworkErrorMessages.invalidURL
        case .noData:
            return NetworkErrorMessages.noData
        case .decodingError:
            return NetworkErrorMessages.decodingError
        case let .serverError(code, _):
            return NetworkErrorMessages.serverError(code)
        case .networkError:
            return NetworkErrorMessages.networkError
        case .timeout:
            return NetworkErrorMessages.timeout
        }
    }
}

extension NetworkError {
    var debugDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data returned from the server"
        case let .decodingError(error):
            return "Decoding failed with error: \(error)"
        case let .serverError(code, data):
            if let data = data, let responseBody = String(data: data, encoding: .utf8) {
                return "Server error with status code \(code). Response: \(responseBody)"
            } else {
                return "Server error with status code \(code). No response body."
            }
        case let .networkError(error):
            return "Network error: \(error)"
        case .timeout:
            return "The request timed out."
        }
    }
}
