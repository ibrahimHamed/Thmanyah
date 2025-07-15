//
//  TestNetworkRequest.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation
@testable import NetworkLayer

struct TestNetworkRequest: NetworkRequest {
    var host: String
    var path: String
    var method: HTTPMethod
    var headers: [String: String]?
    var queryParameters: [String: String]?
    var body: Data?
    var timeout: TimeInterval

    init(
        host: String = "api.example.com",
        path: String = "/test",
        method: HTTPMethod = .get,
        headers: [String: String]? = nil,
        queryParameters: [String: String]? = nil,
        body: Data? = nil,
        timeout: TimeInterval = 30
    ) {
        self.host = host
        self.path = path
        self.method = method
        self.headers = headers
        self.queryParameters = queryParameters
        self.body = body
        self.timeout = timeout
    }
}
