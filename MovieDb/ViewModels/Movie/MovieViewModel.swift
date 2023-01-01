//
//  NewMovieViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 18.12.2022.
//

import Foundation

class MovieViewModel: BaseViewModel {
    @Published var topRatedMovies: MovieTopRated = MovieTopRated()
    @Published var movies: Movie = Movie()
    @Published var movieDetail: MovieDetailModel = MovieDetailModel()
    @Published var genres: GenreModel = GenreModel()
    @Published var isMovieDetailActive = false
    
    var movieDbNetworkClient: MovieDbNetworkProvider = MovieDbNetworkClient()
    
    func getTopRatedMovies() {
        movieDbNetworkClient
            .getTopRatedMovies()
            .replaceError(with: MovieTopRated())
            .assign(to: &$topRatedMovies)
    }
    
    func getMovies() {
        movieDbNetworkClient
            .getMovies()
            .replaceError(with: Movie())
            .assign(to: &$movies)
    }
    
    func getMovieDetail(id: Int) {
        movieDbNetworkClient
            .getMovieDetail(id: id)
            .replaceError(with: MovieDetailModel())
            .assign(to: &$movieDetail)
        
        isMovieDetailActive = true
    }
    
    func getMoviesGenres() {
        movieDbNetworkClient
            .getMoviesGenres()
            .replaceError(with: GenreModel())
            .assign(to: &$genres)
    }
}
