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
    
    func getTvSeries() -> AnyPublisher<TvSeriesModel , Error>
    func getTvTopRated() -> AnyPublisher<TvTopRatedModel , Error>
    func getTvGenres() -> AnyPublisher<GenreModel , Error>
    func getTvSerieDetail(id: Int) -> AnyPublisher<TvSerieDetailModel , Error>
    func getTvSerieCredit(id: Int) -> AnyPublisher<TvSerieCastModel , Error>
    func getPerson(id: Int) -> AnyPublisher<CastPeopleModel , Error>
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
    
    func getTvSeries() -> AnyPublisher<TvSeriesModel , Error> {
        networkClient.request(MovieDbRouter.getTvSeries).decode()
    }
    
    func getTvTopRated() -> AnyPublisher<TvTopRatedModel , Error> {
        networkClient.request(MovieDbRouter.getTvTopRated).decode()
    }
    
    func getTvGenres() -> AnyPublisher<GenreModel , Error> {
        networkClient.request(MovieDbRouter.getTvGenres).decode()
    }
    
    func getTvSerieDetail(id: Int) -> AnyPublisher<TvSerieDetailModel , Error> {
        networkClient.request(MovieDbRouter.getTvSerieDetail(id: id)).decode()
    }
    
    func getTvSerieCredit(id: Int) -> AnyPublisher<TvSerieCastModel , Error> {
        networkClient.request(MovieDbRouter.getTvSerieCredit(id: id)).decode()
    }
    
    func getPerson(id: Int) -> AnyPublisher<CastPeopleModel , Error> {
        networkClient.request(MovieDbRouter.getPerson(id: id)).decode()
    }
}
