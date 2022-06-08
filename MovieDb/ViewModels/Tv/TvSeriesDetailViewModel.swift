//
//  TvSeriesDetailViewModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 27.12.2021.
//

import Foundation

class TvSeriesDetailViewModel: ObservableObject {
    let baseUrl = "https://api.themoviedb.org/3"
    //tv -> https://api.themoviedb.org/3/tv/88329?api_key=bda292e517965b20e63898a81d051a45&language=en-US
    
    func fetchMTvSerieDetail(id: Int, completion: @escaping (_ result: TvSerieDetailModel?, _ success: Bool) -> ()) {
        let endpoint = "/tv/\(id)?api_key=bda292e517965b20e63898a81d051a45&language=en-US"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let tvSerieDetail = try! JSONDecoder().decode(TvSerieDetailModel.self, from: data!)
                print("Result:\n\(tvSerieDetail)")
                completion(tvSerieDetail, true)
            }.resume()
        }
    }
}
