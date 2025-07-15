//
//  HomeViewModel.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var home: Home?
    @Published var error: String?
    @Published var isLoading = false
    @Published var isPresentingSearch = false
    private var fetchTask: Task<Void, Never>?

    private let useCase: HomeUseCaseProtocol
    private var currentPage = 1
    
    var hasMorePages: Bool {
        guard let pagination = home?.pagination else { return false }
        return currentPage < pagination.totalPages
    }

    init(useCase: HomeUseCaseProtocol) {
        self.useCase = useCase
    }
}

// MARK: - Networking

extension HomeViewModel {
    func fetchHome() async {
        currentPage = 1
        cancelTask()
        fetchTask = Task {
            await fetchPage(isRefresh: true)
        }
    }

    func loadNextPage() async {
        guard hasMorePages, !isLoading else { return }
        currentPage += 1
        cancelTask()
        fetchTask = Task {
            await fetchPage(isRefresh: false)
        }
    }

    private func fetchPage(isRefresh: Bool) async {
        guard !isLoading else { return }

        isLoading = true
        if isRefresh {
            error = nil
        }

        do {
            let fetchedHome = try await useCase.fetchHome(page: currentPage)
            if isRefresh {
                self.home = fetchedHome
            } else {
                if !fetchedHome.sections.isEmpty {
                    self.home?.sections.append(contentsOf: fetchedHome.sections)
                }
                self.home?.pagination = fetchedHome.pagination
            }

        } catch {
            self.error = error.localizedDescription
            if !isRefresh {
                self.currentPage -= 1
            }
        }

        isLoading = false
    }
    
    private func cancelTask() {
        fetchTask?.cancel()
        fetchTask = nil
    }
}

// MARK: - Navigation

extension HomeViewModel {
    func showSearchScreen() {
        isPresentingSearch = true
    }
}
