//
//  MovieDbNetworkProvider.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import Foundation
import Combine

protocol MovieDbNetworkProvider {
    func getTopRatedMovies() -> AnyPublisher<MovieTopRated, Error>
    func getMovies() -> AnyPublisher<Movie , Error>
    func getMovieDetail(id: Int) -> AnyPublisher<MovieDetailModel , Error>
    func getMoviesGenres()  -> AnyPublisher<GenreModel , Error>
}

class MovieDbNetworkClient: MovieDbNetworkProvider {
    var networkClient: NetworkProvider = NetworkClient.instance
    
    func getTopRatedMovies() -> AnyPublisher<MovieTopRated, Error> {
        networkClient.request(MovieDbRouter.getTopRatedMovies).decode()
    }
    
    func getMovies() -> AnyPublisher<Movie , Error> {
        networkClient.request(MovieDbRouter.getMovies).decode()
    }
    
    func getMovieDetail(id: Int) -> AnyPublisher<MovieDetailModel , Error> {
        networkClient.request(MovieDbRouter.getMovieDetail(id: id)).decode()
    }
    
    func getMoviesGenres()  -> AnyPublisher<GenreModel , Error> {
        networkClient.request(MovieDbRouter.getMoviesGenres).decode()
    }
}
