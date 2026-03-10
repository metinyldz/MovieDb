//
//  NewMovieViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 18.12.2022.
//

import Foundation

@MainActor
class MovieViewModel: BaseViewModel {
    @Published var topRatedMovies: MovieTopRated = MovieTopRated()
    @Published var movies: Movie = Movie()
    @Published var genres: GenreModel = GenreModel()
    @Published var viewState: ViewState = .idle
    var networkManager = NetworkManager()
    
    func getTopRatedMovies() async throws -> MovieTopRated {
        return try await networkManager.fetch(url: MovieDbRouter.getTopRatedMovies.urlString, expecting: MovieTopRated.self)
    }
    
    func getMovies() async throws -> Movie {
        return try await networkManager.fetch(url: MovieDbRouter.getMovies.urlString, expecting: Movie.self)
    }
    
    func getMoviesGenres() async throws -> GenreModel {
        return try await networkManager.fetch(url: MovieDbRouter.getMoviesGenres.urlString, expecting: GenreModel.self)
    }
    
    enum ViewState {
        case idle
        case loading
        case loaded
        case error(Error)
    }
}
