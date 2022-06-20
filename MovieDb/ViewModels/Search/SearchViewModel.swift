//
//  SearchViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 19.06.2022.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    let baseUrl = "https://api.themoviedb.org/3"
    
    func fetchSearchContent(queryString: String, completion: @escaping (_ result: SearchMultiContentModel?, _ success: Bool) -> ()) {
        let endpoint = "/search/multi?api_key=bda292e517965b20e63898a81d051a45&language=en-US&page=1&query=\(queryString)"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let searchMultiContent = try! JSONDecoder().decode(SearchMultiContentModel.self, from: data!)
                print("Result:\n\(searchMultiContent)")
                completion(searchMultiContent, true)
            }.resume()
        }
    }
}
