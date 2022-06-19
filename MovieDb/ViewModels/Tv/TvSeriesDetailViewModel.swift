//
//  TvSeriesDetailViewModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 27.12.2021.
//

import Foundation

class TvSeriesDetailViewModel: ObservableObject {
    let baseUrl = "https://api.themoviedb.org/3"
    
    ///person/{person_id}
    func fetchPerson(personId: Int, completion: @escaping (_ result: CastPeopleModel?, _ success: Bool) -> ()) {
        let endpoint = "/person/\(personId)?api_key=bda292e517965b20e63898a81d051a45&language=en-US"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let castPeople = try! JSONDecoder().decode(CastPeopleModel.self, from: data!)
                print("Result:\n\(castPeople)")
                completion(castPeople, true)
            }.resume()
        }
    }
}
