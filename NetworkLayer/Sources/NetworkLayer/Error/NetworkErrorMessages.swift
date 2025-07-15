//
//  NetworkErrorMessages.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

public enum NetworkErrorMessages {
    // 🌐 User-friendly messages
    public static let invalidURL = "Oops! Something went wrong with the connection."
    public static let noData = "We couldn’t get any data. Please try again."
    public static let decodingError = "Something went wrong while processing the response."
    public static func serverError(_ code: Int) -> String {
        "The server responded with an error. (Code: \(code))"
    }
    public static let networkError = "You're not connected. Please check your internet and try again."
    public static let timeout = "The request took too long. Please try again later."

    // 🛠 Developer-focused debug messages
    public static let debugInvalidURL = "❌ Invalid URL or URL components could not be constructed."
    public static let debugNoData = "❌ No data was returned and the response could not be parsed."
    public static func debugDecodingError(_ error: Error) -> String {
        "❌ Failed to decode response with error: \(error)"
    }
    public static func debugServerError(_ code: Int, _ data: Data?) -> String {
        if let data = data, let responseBody = String(data: data, encoding: .utf8) {
            return "❌ Server error. Status code: \(code). Response body: \(responseBody)"
        } else {
            return "❌ Server error. Status code: \(code). No response body."
        }
    }
    public static func debugNetworkError(_ error: Error) -> String {
        "❌ Network error occurred: \(error)"
    }
    public static let debugTimeout = "❌ The request timed out."
}
