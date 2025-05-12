//
//  ShowDetailViewModel.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 09/05/2025.
//


import Foundation

@MainActor
class ShowDetailViewModel: ObservableObject {
    @Published var episodesBySeason: [Int: [Episode]] = [:]
    @Published var errorMessage: String?

    func fetchEpisodes(for showId: Int) {
        Task {
            do {
                let episodes = try await APIService.shared.fetchEpisodes(for: showId)
                episodesBySeason = Dictionary(grouping: episodes, by: { $0.season })
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
