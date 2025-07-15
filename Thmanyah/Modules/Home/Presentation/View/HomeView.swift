//
//  HomeView.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @EnvironmentObject var diContainer: AppDIContainer
    private let sectionRendererFactory = SectionRendererFactory()
    private let headerFactory = HeaderRendererFactory()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if let sections = viewModel.home?.sections, !sections.isEmpty {
                    sectionsList(sections)
                } else {
                    EmptyView(type: .noContent)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    SearchButton(action: viewModel.showSearchScreen)
                }
                ToolbarItem(placement: .topBarLeading) {
                    GreetingHeaderView()
                }
            }
        }
        .loading(viewModel.isLoading)
        .retryErrorOverlay(message: $viewModel.error) {
            Task { await viewModel.fetchHome() }
        }
        .sheet(isPresented: $viewModel.isPresentingSearch) {
            diContainer.makeSearchView()
        }
        .task {
            if viewModel.home == nil {
                await viewModel.fetchHome()
            }
        }
        
    }
}

extension HomeView {
    private func sectionsList(_ sections: [CommonSection]) -> some View {
        List {
            ForEach(sections, id: \.id) { section in
                Section {
                    sectionRendererFactory.makeRenderer(for: section)
                } header: {
                    headerFactory.makeHeaderView(for: section)
                }
                .listRowSeparator(.hidden)
                .onAppear {
                    if section.id == sections.suffix(3).first?.id {
                        Task {
                            await viewModel.loadNextPage()
                        }
                    }
                }
            }
            
            if viewModel.hasMorePages {
                LoadingIndicator()
            }
        }
        .listStyle(.plain)
        .listSectionSeparator(.hidden)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .refreshable {
            await viewModel.fetchHome()
        }
    }
}

#Preview {
    HomeView(viewModel: AppDIContainer().homeContainer.makeHomeViewModel())
}
