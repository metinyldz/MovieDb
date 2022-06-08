//
//  MovieDetailViewModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 27.12.2021.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    let baseUrl = "https://api.themoviedb.org/3"
    
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
