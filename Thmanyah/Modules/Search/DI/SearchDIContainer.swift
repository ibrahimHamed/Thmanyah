//
//  SearchDIContainer.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import NetworkLayer

final class SearchDIContainer {
    
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    lazy var searchService = SearchAPIService(network: networkService)
    lazy var searchRepository = SearchRepository(service: searchService)
    lazy var searchUseCase = SearchUseCase(repository: searchRepository)
 
    @MainActor
    func makeSearchViewModel() -> SearchViewModel {
        SearchViewModel(useCase: searchUseCase)
    }
    
    @MainActor
    func makeSearchView() -> SearchView {
        SearchView(viewModel: self.makeSearchViewModel())
    }
}
