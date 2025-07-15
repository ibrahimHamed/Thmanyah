//
//  SearchViewModel.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Combine
import Foundation

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var searchResult: Search?
    @Published var error: String?
    @Published var isLoading = false
    @Published var targetWord: String = ""
    
    private var searchTask: Task<Void, Never>?
    private var cancellables = Set<AnyCancellable>()
    private let useCase: SearchUseCaseProtocol
    private var lastSearchedWord: String = ""

    init(useCase: SearchUseCaseProtocol) {
        self.useCase = useCase
        setupSearchObserver()
    }

    private func setupSearchObserver() {
        $targetWord
            .removeDuplicates()
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .handleEvents(receiveOutput: { [weak self] word in
                guard let self else { return }
                if word.isEmpty {
                    self.searchResult = nil
                    self.error = nil
                }
            })
            .filter { !$0.isEmpty && $0.lowercased() != self.lastSearchedWord.lowercased() }
            .sink { [weak self] word in
                guard let self else { return }
                lastSearchedWord = word
                self.searchTask?.cancel()
                searchTask = Task {
                    await self.search(word: word)
                }
            }
            .store(in: &cancellables)
    }

    func search(word: String) async {
        isLoading = true
        defer {
            isLoading = false
            searchTask = nil
        }

        do {
            let result = try await useCase.search(with: word)
            self.searchResult = result
            self.error = nil
        } catch is CancellationError {
        } catch {
            self.searchResult = nil
            self.error = error.localizedDescription
        }
    }
    
    func retry() {
        searchTask?.cancel()
        searchTask = Task {
            await self.search(word: lastSearchedWord)
        }
    }

}
