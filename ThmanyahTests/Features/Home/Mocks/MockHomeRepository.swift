//
//  MockHomeRepository.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import Foundation
@testable import Thmanyah

final class MockHomeRepository: HomeRepositoryProtocol {
    var homeToReturn: Home?
    var errorToThrow: Error?

    func fetchHome(page: Int) async throws -> Home {
        if let error = errorToThrow {
            throw error
        }
        return homeToReturn!
    }
}
