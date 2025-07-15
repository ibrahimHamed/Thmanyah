//
//  HomeDIContainer.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import NetworkLayer

final class HomeDIContainer {
    
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    lazy var homeService = HomeAPIService(network: networkService)
    lazy var homeRepository = HomeRepository(service: homeService)
    lazy var homeUseCase = HomeUseCase(repository: homeRepository)

    @MainActor
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(useCase: homeUseCase)
    }
    
    @MainActor
    func makeHomeView() -> HomeView {
        HomeView(viewModel: self.makeHomeViewModel())
    }
}
