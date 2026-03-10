//
//  SearchViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 19.06.2022.
//

import Foundation

@MainActor
class SearchViewModel: BaseViewModel {
    @Published var viewState: ViewState = .loaded(nil)
    var networkManager = NetworkManager()
    
    func fetchSearchContent(queryString: String) async throws -> SearchMultiContentModel {
        return try await networkManager.fetch(
            url: MovieDbRouter.searchMulti(query: queryString).urlString,
            expecting: SearchMultiContentModel.self
        )
    }
    
    enum ViewState {
        case idle
        case loading
        case loaded(SearchMultiContentModel?)
        case error(Error)
    }
}
