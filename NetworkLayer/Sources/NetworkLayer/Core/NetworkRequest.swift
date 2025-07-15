//
//  NetworkRequest.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

public protocol NetworkRequest {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryParameters: [String: String]? { get }
    var body: Data? { get }
    var timeout: TimeInterval { get }
}

public extension NetworkRequest {
    var scheme: String { NetworkConstants.schema }
    var headers: [String: String]? { NetworkConstants.defaultHeaders }
    var queryParameters: [String: String]? { nil }
    var body: Data? { nil }
    var timeout: TimeInterval { 60 }
    
    var baseURL: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        return components.url
    }
}
