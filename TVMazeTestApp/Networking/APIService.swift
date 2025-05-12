//
//  APIService.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 09/05/2025.
//


import Foundation

class APIService {
    static let shared = APIService()
    private let baseURL = "https://api.tvmaze.com"

    func fetchShows(page: Int) async throws -> [Show] {
        let url = URL(string: "\(baseURL)/shows?page=\(page)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Show].self, from: data)
    }

    func searchShows(query: String) async throws -> [Show] {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: "\(baseURL)/search/shows?q=\(encodedQuery)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let results = try JSONDecoder().decode([SearchResult].self, from: data)
        return results.map { $0.show }
    }

    func fetchEpisodes(for showId: Int) async throws -> [Episode] {
        let url = URL(string: "\(baseURL)/shows/\(showId)/episodes")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Episode].self, from: data)
    }

    private struct SearchResult: Codable {
        let show: Show
    }
}
