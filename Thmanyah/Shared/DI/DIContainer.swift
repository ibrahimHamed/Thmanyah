//
//  DIContainer.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation
import NetworkLayer

protocol DIContainer: ObservableObject {
    var networkService: NetworkService { get }
    var homeContainer: HomeDIContainer { get }
    var searchContainer: SearchDIContainer { get }
}
