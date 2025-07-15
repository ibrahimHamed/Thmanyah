//
//  HomeRepository.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

final class HomeRepository: HomeRepositoryProtocol {
    private let service: HomeAPIServiceProtocol

    init(service: HomeAPIServiceProtocol) {
        self.service = service
    }

    func fetchHome(page: Int) async throws -> Home {
        do {
            let dto = try await service.fetchHome(page: page)
            return dto.toDomain()
        } catch let error {
            throw error
        }
    }
}
