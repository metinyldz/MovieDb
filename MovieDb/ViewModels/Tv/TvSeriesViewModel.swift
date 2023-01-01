//
//  TvSeriesViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.06.2022.
//

import Foundation
import SwiftUI

class TvSeriesViewModel: BaseViewModel {
    @Published var tvSeries: TvSeriesModel = TvSeriesModel()
    @Published var tvTopRated: TvTopRatedModel = TvTopRatedModel()
    @Published var tvGenres: GenreModel = GenreModel()
    @Published var tvSerieDetail: TvSerieDetailModel = TvSerieDetailModel()
    @Published var tvSerieCast: TvSerieCastModel = TvSerieCastModel()
    @Published var isActive = false
    
    var movieDbNetworkClient: MovieDbNetworkProvider = MovieDbNetworkClient()
    
    func getTvSeries() {
        movieDbNetworkClient
            .getTvSeries()
            .replaceError(with: TvSeriesModel())
            .assign(to: &$tvSeries)
    }
    
    func getTvTopRated() {
        movieDbNetworkClient
            .getTvTopRated()
            .replaceError(with: TvTopRatedModel())
            .assign(to: &$tvTopRated)
    }
    
    func getTvGenres() {
        movieDbNetworkClient
            .getTvGenres()
            .replaceError(with: GenreModel())
            .assign(to: &$tvGenres)
    }
    
    func getTvSerieDetail(id: Int) {
        movieDbNetworkClient
            .getTvSerieDetail(id: id)
            .replaceError(with: TvSerieDetailModel())
            .assign(to: &$tvSerieDetail)
        
        isActive = true
    }
    
    func getTvSerieCredit(id: Int) {
        movieDbNetworkClient
            .getTvSerieCredit(id: id)
            .replaceError(with: TvSerieCastModel())
            .assign(to: &$tvSerieCast)
    }
}
