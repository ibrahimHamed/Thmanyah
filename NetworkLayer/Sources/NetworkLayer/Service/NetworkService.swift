//
//  NetworkService.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

public protocol NetworkService {
    func request<T: Decodable>(_ request: NetworkRequest, decodeTo type: T.Type) async throws -> T
    func requestRaw(_ request: NetworkRequest) async throws -> Data
    func cancelAllRequests()
}
