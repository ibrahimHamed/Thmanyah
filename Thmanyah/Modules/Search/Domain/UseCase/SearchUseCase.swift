//
//  SearchUseCase.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

final class SearchUseCase: SearchUseCaseProtocol {
    private let repository: SearchRepositoryProtocol

    init(repository: SearchRepositoryProtocol) {
        self.repository = repository
    }

    func search(with word: String) async throws -> Search {
        try await repository.search(with: word)
    }
}
