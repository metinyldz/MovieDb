//
//  MovieViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.06.2022.
//

import Foundation
import SwiftUI

/*
 H2
 1- MVVM ile bu projeyi yap.
 2- Generic bir web servis olacak.
        2.1 - Main thread'e göz at.
 3- Combine Kullanarak yap. Araştır!
 4- Paging yapısını kullan. (Infinite Scroll ile yapılacak.)
 5- Register sayfasını yap.
        Validator ekle. (Güvenlik önlemleri)
        Sadece kayıtlı olan kullanıcı adı ve şifre ile giirş yapabilsin. (Firebase'de tut.)
 6- Content Detay ksımı büyük fotoda düzenleme yap. (Efektler ile)
 7- Profil'deki favori içerikleri kaldırabilme işini yap.
 8- Bir Medium yazısı yaz.
 
 Cemal Yılmaz!!!
 GitHub'tan movieDb repo'ya bak.
 */

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
                print("Result:\n\(movieTopRated.results!)")
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
    
    func fetchMovieDetail(id: Int, completion: @escaping (_ result: MovieDetailModel?, _ success: Bool) -> ()) {
        //https://api.themoviedb.org/3/movie/634649?api_key=bda292e517965b20e63898a81d051a45&language=en-US
        let endpoint = "/movie/\(id)?api_key=bda292e517965b20e63898a81d051a45&language=en-US"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let movieDetail = try! JSONDecoder().decode(MovieDetailModel.self, from: data!)
                print("Result:\n\(movieDetail)")
                completion(movieDetail, true)
            }.resume()
        }
    }
}

