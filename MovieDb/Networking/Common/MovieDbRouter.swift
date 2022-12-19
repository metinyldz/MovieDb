//
//  MovieDbRouter.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import Foundation

enum MovieDbRouter: RequestInfoConvertible {
    
    //MARK: - Movies -
    case getTopRatedMovies
    case getMovies
    case getMovieDetail(id: Int)
    case getMoviesGenres
    
    //MARK: - Tv Series -
    case getTvSeries
    case getTvTopRated
    case getTvGenres
    case getTvSerieDetail(id: Int)
    case getTvSerieCredit(id: Int)
    
    var endpoint: String {
        "https://api.themoviedb.org/3"
    }
    
    var apiKey: String {
        "bda292e517965b20e63898a81d051a45"
    }
    
    var urlString: String {
        "\(endpoint)/\(path)"
    }
    
    var path: String {
        switch self {
        case .getTopRatedMovies:
            return "/movie/top_rated?api_key=\(apiKey)&language=en-US&page=1"
        case .getMovies:
            return "/movie/popular?api_key=\(apiKey)&language=en-US&page=1"
        case .getMovieDetail(let id):
            return "/movie/\(id)?api_key=\(apiKey)&language=en-US"
        case .getMoviesGenres:
            return "/genre/movie/list?api_key=\(apiKey)&language=en-US"
            
        case .getTvSeries:
            return "/tv/popular?api_key=\(apiKey)&language=en-US&page=1"
        case .getTvTopRated:
            return "/tv/top_rated?api_key=\(apiKey)&language=en-US&page=1"
        case .getTvGenres:
            return "/genre/tv/list?api_key=\(apiKey)&language=en-US"
        case .getTvSerieDetail(let id):
            return "/tv/\(id)?api_key=\(apiKey)&language=en-US"
        case .getTvSerieCredit(let id):
            return "/tv/\(id)/credits?api_key=\(apiKey)&language=en-US"
        }
    }
    
    func asRequestInfo() -> RequestInfo {
        let requestInfo: RequestInfo = RequestInfo(url: urlString)
                
        // Set other property, like headers, parameters for requestInfo here
        
        return requestInfo
    }
}
