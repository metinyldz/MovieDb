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
    // /search/multi
    
    func fetchSearchContent(queryString: String, completion: @escaping (_ result: SearchContentModel?, _ success: Bool) -> ()) {
        let endpoint = "/search/multi?api_key=bda292e517965b20e63898a81d051a45&language=en-US&page=1&query=\(queryString)"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                let searchContent = try! JSONDecoder().decode(SearchContentModel.self, from: data!)
                print("Result:\n\(searchContent)")
                completion(searchContent, true)
            }.resume()
        }
    }
}
    

