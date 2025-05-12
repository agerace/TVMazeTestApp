//
//  EpisodeDetailView.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 09/05/2025.
//


import SwiftUI

struct EpisodeDetailView: View {
    let episode: Episode

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageURL = episode.image?.original ?? episode.image?.medium {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                }

                Text("S\(episode.season)E\(episode.number): \(episode.name)")
                    .font(.title2)
                    .bold()

                if let summary = episode.summary {
                    Text(summary.stripHTML())
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationTitle(episode.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
