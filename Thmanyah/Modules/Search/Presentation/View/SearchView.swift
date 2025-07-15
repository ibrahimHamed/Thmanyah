//
//  SearchView.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    private let sectionRendererFactory = SectionRendererFactory()
    private let headerRendererFactory = HeaderRendererFactory()
    var body: some View {
        NavigationStack {
            ZStack {
                if let sections = viewModel.searchResult?.sections, !sections.isEmpty {
                    sectionsList(sections)
                } else if !viewModel.targetWord.isEmpty {
                    EmptyView(type: .noResults)
                } else {
                    EmptyView(type: .search)
                }
            }
            .searchable(text: $viewModel.targetWord, prompt: "Search...")
            .navigationTitle("Search")
            .onTapGesture {
                hideKeyboard()
            }
        }
        .accentColor(.goldenYellow)
        .retryErrorOverlay(message: $viewModel.error) {
            viewModel.retry()
        }
    }
    
    private func sectionsList(_ sections: [CommonSection]) -> some View {
        List {
            ForEach(sections, id: \.id) { section in
                Section {
                    sectionRendererFactory.makeRenderer(for: section)
                } header: {
                    headerRendererFactory.makeHeaderView(for: section)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .listSectionSeparator(.hidden)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    SearchView(viewModel: AppDIContainer().searchContainer.makeSearchViewModel())
}
