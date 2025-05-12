//
//  ShowListView.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 09/05/2025.
//

import SwiftUI

struct ShowListView: View {
    @StateObject private var viewModel = ShowListViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(currentShows) { show in
                    NavigationLink(destination: ShowDetailView(show: show)) {
                        HStack {
                            AsyncImage(url: URL(string: show.image?.medium ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 50, height: 75)
                            .cornerRadius(6)

                            Text(show.name)
                                .font(.headline)
                        }
                    }
                }

                if !viewModel.isSearching {
                    ProgressView()
                        .onAppear {
                            viewModel.loadNextPage()
                        }
                }
            }
            .navigationTitle("TV Shows")
            .searchable(text: $searchText)
            .onChange(of: searchText) { newValue in
                viewModel.searchShows(query: newValue)
            }
            .onAppear {
                if viewModel.shows.isEmpty {
                    viewModel.loadNextPage()
                }
            }
        }
    }

    private var currentShows: [Show] {
        viewModel.isSearching ? viewModel.searchResults : viewModel.shows
    }
}
