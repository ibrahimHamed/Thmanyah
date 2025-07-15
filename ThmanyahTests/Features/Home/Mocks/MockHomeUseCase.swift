//
//  MockHomeUseCase.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import Foundation
@testable import Thmanyah

final class MockHomeUseCase: HomeUseCaseProtocol {
    var homeToReturn: Home?
    var errorToThrow: Error?
    var callCount = 0

    func fetchHome(page: Int) async throws -> Home {
        callCount += 1
        if let error = errorToThrow {
            throw error
        }
        return homeToReturn!
    }
}
