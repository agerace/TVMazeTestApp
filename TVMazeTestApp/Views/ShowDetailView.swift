//
//  ShowDetailView.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 09/05/2025.
//

import SwiftUI

struct ShowDetailView: View {
    let show: Show
    @StateObject private var viewModel = ShowDetailViewModel()
    @State var showEpisodes = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: show.image?.original ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)

                Text(show.name)
                    .font(.title)
                    .bold()

                Text("Airs: \(show.schedule.days.joined(separator: ", ")) at \(show.schedule.time)")
                    .font(.subheadline)

                if !show.genres.isEmpty {
                    Text("Genres: \(show.genres.joined(separator: ", "))")
                        .font(.subheadline)
                }

                if let summary = show.summary {
                    Text(summary.stripHTML())
                        .font(.body)
                }

                if !showEpisodes {
                    Button("Show Episodes") {
                        self.showEpisodes.toggle()
                    }
                } else {
                    ForEach(viewModel.episodesBySeason.keys.sorted(), id: \.self) { season in
                        Section(header: Text("Season \(season)").font(.headline)) {
                            ForEach(viewModel.episodesBySeason[season] ?? []) { episode in
                                NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                                    Text("Episode \(episode.number): \(episode.name)")
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(show.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                viewModel.fetchEpisodes(for: show.id)
            }
        }
    }
}
