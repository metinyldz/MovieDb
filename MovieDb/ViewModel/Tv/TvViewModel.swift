//
//  TvViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 30.05.2022.
//

import Foundation
import SwiftUI

class TvViewModel: ObservableObject {
    let baseUrl = "https://api.themoviedb.org/3"

    func fetchTvSeries(completion: @escaping (_ result: [TvSeriesResult]?,_ success: Bool) ->()) {
        //https://api.themoviedb.org/3
        let endpoint = "/tv/popular?api_key=bda292e517965b20e63898a81d051a45&language=en-US&page=1"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let tvSeries = try! JSONDecoder().decode(TvSeriesModel.self, from: data!)
                print("Result:\n\(tvSeries.results!)")
                completion(tvSeries.results, true)
            }.resume()
        }
    }
    
    func fetchTvTopRated(completion: @escaping (_ result: [TvTopRatedResult]?,_ success: Bool) ->()) {
        let endpoint = "/tv/top_rated?api_key=bda292e517965b20e63898a81d051a45&language=en-US&page=1"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let tvTopRated = try! JSONDecoder().decode(TvTopRatedModel.self, from: data!)
                print("Result:\n\(tvTopRated.results!)")
                completion(tvTopRated.results, true)
            }.resume()
        }
    }
    
    func fetchTvGenres(completion: @escaping (_ result: [GenreResult]?, _ success: Bool) -> ()) {
        let endpoint = "/genre/tv/list?api_key=bda292e517965b20e63898a81d051a45&language=en-US"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let genreResult = try! JSONDecoder().decode(GenreModel.self, from: data!)
                print("Result:\n\(genreResult)")
                GenreModel.tvInstance = genreResult.genres
                completion(genreResult.genres, true)
            }.resume()
        }
    }
}
