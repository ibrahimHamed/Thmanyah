//
//  MockSearchUseCase.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
@testable import Thmanyah

final class MockSearchUseCase: SearchUseCaseProtocol {
    var resultToReturn: Search?
    var errorToThrow: Error?
    var callCount = 0

    func search(with word: String) async throws -> Search {
        callCount += 1
        if let error = errorToThrow {
            throw error
        }
        return resultToReturn!
    }
}
