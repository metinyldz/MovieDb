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
}

class MovieDbNetworkClient: MovieDbNetworkProvider {
    var networkClient: NetworkProvider = NetworkClient.instance
    
    func getTopRatedMovies() -> AnyPublisher<MovieTopRated, Error> {
        networkClient.request(MovieDbRouter.getTopRatedMovies).decode()
    }
}
