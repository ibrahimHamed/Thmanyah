//
//  MockHomeAPIService.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import Foundation
@testable import Thmanyah

final class MockHomeAPIService: HomeAPIServiceProtocol {
    var dtoToReturn: HomeDTO?
    var errorToThrow: Error?

    func fetchHome(page: Int) async throws -> HomeDTO {
        if let error = errorToThrow {
            throw error
        }
        return dtoToReturn!
    }
}
