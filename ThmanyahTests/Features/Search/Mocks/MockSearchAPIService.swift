//
//  MockSearchAPIService.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
@testable import Thmanyah

final class MockSearchAPIService: SearchAPIServiceProtocol {
    var dtoToReturn: SearchDTO?
    var errorToThrow: Error?

    func search(with word: String) async throws -> SearchDTO {
        if let error = errorToThrow {
            throw error
        }
        return dtoToReturn!
    }
}
