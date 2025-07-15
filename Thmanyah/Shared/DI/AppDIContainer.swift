//
//  AppDIContainer.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation
import NetworkLayer

final class AppDIContainer: DIContainer, ObservableObject {
    
    lazy var networkService: NetworkService = URLSessionNetworkService()
    
    lazy var homeContainer: HomeDIContainer = {
        HomeDIContainer(networkService: networkService)
    }()
    
    lazy var searchContainer: SearchDIContainer = {
        SearchDIContainer(networkService: networkService)
    }()
    
    @MainActor
    func makeHomeView() -> HomeView {
        homeContainer.makeHomeView()
    }
    
    @MainActor
    func makeSearchView() -> SearchView {
        searchContainer.makeSearchView()
    }
}
