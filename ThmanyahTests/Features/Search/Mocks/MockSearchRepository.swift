//
//  MockSearchRepository.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
@testable import Thmanyah

final class MockSearchRepository: SearchRepositoryProtocol {
    var resultToReturn: Search?
    var errorToThrow: Error?

    func search(with word: String) async throws -> Search {
        if let error = errorToThrow {
            throw error
        }
        return resultToReturn!
    }
}
