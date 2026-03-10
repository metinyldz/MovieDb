//
//  MovieView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 21.04.2025.
//

import SwiftUI

struct MovieView: View {
    @StateObject var movieViewModel = MovieViewModel()
    
    var body: some View {
        MainBackgroundContainer {
            MovieContent(viewModel: movieViewModel)
        }
        .onFirstAppear {
            Task {
                movieViewModel.viewState = .loading
                do {
                    async let topRated = movieViewModel.getTopRatedMovies()
                    async let movies = movieViewModel.getMovies()
                    async let genres = movieViewModel.getMoviesGenres()
                    
                    let (topRatedResult, moviesResult, genresResult) = try await (topRated, movies, genres)
                    
                    movieViewModel.topRatedMovies = topRatedResult
                    movieViewModel.movies = moviesResult
                    movieViewModel.genres = genresResult
                    movieViewModel.viewState = .loaded
                } catch {
                    movieViewModel.viewState = .error(error)
                }
            }
        }
    }
}

#Preview {
    MovieView()
        .environmentObject(ContentBindigs())
}
