//
//  HomeUseCase.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

final class HomeUseCase: HomeUseCaseProtocol {
    private let repository: HomeRepositoryProtocol

    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }

    func fetchHome(page: Int) async throws -> Home {
        try await repository.fetchHome(page: page)
    }
}
