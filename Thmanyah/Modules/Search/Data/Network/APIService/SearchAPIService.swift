//
//  SearchAPIService.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import NetworkLayer

protocol SearchAPIServiceProtocol {
    func search(with word: String) async throws -> SearchDTO
}

struct SearchAPIService: SearchAPIServiceProtocol {
    private let network: NetworkService

    init(network: NetworkService) {
        self.network = network
    }

    func search(with word: String) async throws -> SearchDTO {
        let request = SearchNetworkRequest(word: word)
        return try await network.request(request, decodeTo: SearchDTO.self)
    }
}
