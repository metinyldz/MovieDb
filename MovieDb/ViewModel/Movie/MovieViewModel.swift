//
//  MovieViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 30.05.2022.
//

import Foundation
import SwiftUI

class MovieViewModel: ObservableObject {
    let baseUrl = "https://api.themoviedb.org/3"
    
    func fetchMovieTopRated(completion: @escaping (_ result: [MovieTopRatedResult]?, _ success: Bool) -> ()) {
        let endpoint = "/movie/top_rated?api_key=bda292e517965b20e63898a81d051a45&language=en-US&page=1"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let movieTopRated = try! JSONDecoder().decode(MovieTopRated.self, from: data!)
                print("Result:\n\(movieTopRated.results)")
                completion(movieTopRated.results, true)
            }.resume()
        }
    }
    
    func fetchMovies(completion: @escaping (_ result: [MovieResult]?, _ success: Bool) -> ()) {
        let endpoint = "/movie/popular?api_key=bda292e517965b20e63898a81d051a45&language=en-US&page=1"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let movies = try! JSONDecoder().decode(Movie.self, from: data!)
                print("Result:\n\(movies.results!)")
                completion(movies.results, true)
            }.resume()
        }
    }
        
    func fetchMovieGenres(completion: @escaping (_ result: [GenreResult]?, _ success: Bool) -> ()) {
        let endpoint = "/genre/movie/list?api_key=bda292e517965b20e63898a81d051a45&language=en-US"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let genreResult = try! JSONDecoder().decode(GenreModel.self, from: data!)
                print("Result:\n\(genreResult)")
                GenreModel.movieInstance = genreResult.genres
                completion(genreResult.genres, true)
            }.resume()
        }
    }
}
