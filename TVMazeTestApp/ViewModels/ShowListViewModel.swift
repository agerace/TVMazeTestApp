//
//  ShowListViewModel.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 09/05/2025.
//


import Foundation

@MainActor
class ShowListViewModel: ObservableObject {
    @Published var shows: [Show] = []
    @Published var searchResults: [Show] = []
    @Published var isSearching = false
    @Published var errorMessage: String?

    private var page = 0

    func loadNextPage() {
        Task {
            do {
                let newShows = try await APIService.shared.fetchShows(page: page)
                shows.append(contentsOf: newShows)
                page += 1
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }

    func searchShows(query: String) {
        guard !query.isEmpty else {
            searchResults = []
            isSearching = false
            return
        }

        isSearching = true

        Task {
            do {
                let results = try await APIService.shared.searchShows(query: query)
                searchResults = results
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
