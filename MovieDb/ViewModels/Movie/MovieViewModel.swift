//
//  NewMovieViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 18.12.2022.
//

import Foundation

class MovieViewModel: BaseViewModel {
    @Published var hasError = false
    @Published var error: UserError?
    
    @Published var topRatedMovies: MovieTopRated = MovieTopRated()
    @Published var movies: Movie = Movie()
    @Published var movieDetail: MovieDetailModel = MovieDetailModel()
    @Published var genres: GenreModel = GenreModel()
    @Published var isMovieDetailActive = false
    var networkClient: MovieDbNetworkProvider = MovieDbNetworkClient()
    
    func getTopRatedMovies() {
        networkClient
            .getTopRatedMovies()
            .replaceError(with: MovieTopRated())
            .assign(to: &$topRatedMovies)
    }
    
    func getMovies() {
        networkClient
            .getMovies()
            .replaceError(with: Movie())
            .assign(to: &$movies)
    }
    
    func getMovieDetail(id: Int) {
        networkClient
            .getMovieDetail(id: id)
            .replaceError(with: MovieDetailModel())
            .assign(to: &$movieDetail)
        
        isMovieDetailActive = true
    }
    
    func getMoviesGenres() {
        networkClient
            .getMoviesGenres()
            .replaceError(with: GenreModel())
            .assign(to: &$genres)
    }
}
