//
//  SearchRepository.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

final class SearchRepository: SearchRepositoryProtocol {
    private let service: SearchAPIServiceProtocol

    init(service: SearchAPIServiceProtocol) {
        self.service = service
    }

    func search(with word: String) async throws -> Search {
        do {
            let dto = try await service.search(with: word)
            return dto.toDomain()
        } catch let error {
            throw error
        }
    }
}
