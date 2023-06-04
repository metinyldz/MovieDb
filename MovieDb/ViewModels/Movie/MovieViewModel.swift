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
    @Published var movieDetail: MovieDetailModel = MovieDetailModel()
    @Published var genres: GenreModel = GenreModel()
    @Published var isMovieDetailActive = false
    
    var networkManager = NetworkManager()
    
    func getTopRatedMovies() async {
        do {
            topRatedMovies = try await networkManager.fetch(url: MovieDbRouter.getTopRatedMovies.urlString, expecting: MovieTopRated.self)
        } catch {
            print(error)
        }
    }
    
    func getMovies() async {
        do {
            movies = try await networkManager.fetch(url: MovieDbRouter.getMovies.urlString, expecting: Movie.self)
        } catch {
            print(error)
        }
    }
    
    func getMovieDetail(id: Int) async {
        do {
            movieDetail = try await networkManager.fetch(url: MovieDbRouter.getMovieDetail(id: id).urlString, expecting: MovieDetailModel.self)
            isMovieDetailActive = true
        } catch {
            print(error)
        }
    }
    
    func getMoviesGenres() async {
        do {
            genres = try await networkManager.fetch(url: MovieDbRouter.getMoviesGenres.urlString, expecting: GenreModel.self)
        } catch {
            print(error)
        }
    }
}
