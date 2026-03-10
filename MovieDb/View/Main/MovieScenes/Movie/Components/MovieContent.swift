//
//  MovieContent.swift
//  MovieDb
//
//  Created by Metin Yıldız on 25.01.2026.
//

import SwiftUI

struct MovieContent: View {
    @ObservedObject var viewModel: MovieViewModel
    
    var body: some View {
        switch viewModel.viewState {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView()
                .tint(Color("VibrantBlue"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        case .loaded:
            let topRatedMovies = viewModel.topRatedMovies.results ?? []
            let popularMovies = viewModel.movies.results ?? []
            let genres = viewModel.genres.genres ?? []

            if topRatedMovies.isEmpty && popularMovies.isEmpty {
                emptyStateView
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: .zero) {
                        Color("VibrantBlue")
                            .frame(height: 300)
                        
                        MovieHorizontalTopRatedList(
                            movies: topRatedMovies,
                            genres: genres
                        )
                            .padding(.top, -130)
                        
                        Divider()
                            .padding()
                            .padding(.top, 20)
                        
                        MoviePopularList(
                            movies: popularMovies,
                            genres: genres
                        )
                            .padding(.horizontal, 24)
                    }
                }
                .ignoresSafeArea(.all)
                .navigationTitle("Movies")
            }
        case .error:
            EmptyView()
        }
    }

    private var emptyStateView: some View {
        VStack(spacing: 12) {
            Image(systemName: "film")
                .font(.system(size: 40, weight: .semibold))
                .foregroundStyle(Color("VibrantBlue"))
            Text("No movies found")
                .font(.title3)
                .fontWeight(.semibold)
            Text("Try again later.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Movies")
    }
}
