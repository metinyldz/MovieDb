//
//  SearchViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 19.06.2022.
//

import Foundation
import SwiftUI

@MainActor
class SearchViewModel: BaseViewModel {
    @Published var searchState: SearchState = .loaded(nil)
    let baseUrl = "https://api.themoviedb.org/3"
    
    func fetchSearchContent(queryString: String, completion: @escaping (_ result: SearchMultiContentModel?, _ success: Bool) -> ()) {
        searchState = .loading
        let endpoint = "/search/multi?api_key=bda292e517965b20e63898a81d051a45&language=en-US&page=1&query=\(queryString)"
        DispatchQueue.main.async {
            guard let url = URL(string: "\(self.baseUrl)\(endpoint)") else {
                completion(nil, false)
                return
            }
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                do {
                    let searchMultiContent = try JSONDecoder().decode(SearchMultiContentModel.self, from: data!)
                    print("Result:\n\(searchMultiContent)")
                    self?.searchState = .loaded(searchMultiContent) // TODO: Fix the warning
                    completion(searchMultiContent, true)
                } catch(let error) {
                    self?.searchState = .failure(error) // TODO: Fix the warning
                    print("Error!")
                }

            }.resume()
        }
    }
    
    enum SearchState {
        case idle
        case loading
        case loaded(SearchMultiContentModel?)
        case failure(Error)
    }
}
