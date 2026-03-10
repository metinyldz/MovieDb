//
//  MovieDetailViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 10.03.2026.
//

import Foundation

@MainActor
class MovieDetailViewModel: BaseViewModel {
    @Published var viewState: ViewState = .idle
    
    var movieDetail: MovieDetailModel? = MovieDetailModel()
    var networkManager = NetworkManager()
    
    func getMovieDetail(id: Int) async throws -> MovieDetailModel {
        return try await networkManager.fetch(url: MovieDbRouter.getMovieDetail(id: id).urlString, expecting: MovieDetailModel.self)
    }
    
    enum ViewState {
        case idle
        case loading
        case loaded
        case error(Error)
    }
}
