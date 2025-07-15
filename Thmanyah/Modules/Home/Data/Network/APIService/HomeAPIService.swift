//
//  HomeAPIService.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import NetworkLayer

protocol HomeAPIServiceProtocol {
    func fetchHome(page: Int) async throws -> HomeDTO
}

struct HomeAPIService: HomeAPIServiceProtocol {
    private let network: NetworkService

    init(network: NetworkService) {
        self.network = network
    }

    func fetchHome(page: Int) async throws -> HomeDTO {
        let request = HomeNetworkRequest(page: page)
        return try await network.request(request, decodeTo: HomeDTO.self)
    }
}
