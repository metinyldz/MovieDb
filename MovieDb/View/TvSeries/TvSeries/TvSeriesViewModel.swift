//
//  TvSeriesViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.06.2022.
//

import Foundation
import SwiftUI

@MainActor
class TvSeriesViewModel: BaseViewModel {
    @Published var tvSeries: TvSeriesModel = TvSeriesModel()
    @Published var tvTopRated: TvTopRatedModel = TvTopRatedModel()
    @Published var tvGenres: GenreModel = GenreModel()
    @Published var tvSerieDetail: TvSerieDetailModel = TvSerieDetailModel()
    @Published var tvSerieCast: TvSerieCastModel = TvSerieCastModel()
    @Published var isActive = false
    
    var networkManager = NetworkManager()
    
    func getTvSeries() async {
        do {
            tvSeries = try await networkManager.fetch(url: MovieDbRouter.getTvSeries.urlString, expecting: TvSeriesModel.self)
        } catch {
            print(error)
        }
    }
    
    func getTvTopRated() async {
        do {
            tvTopRated = try await networkManager.fetch(url: MovieDbRouter.getTvTopRated.urlString, expecting: TvTopRatedModel.self)
        } catch {
            print(error)
        }
    }
    
    func getTvGenres() async {
        do {
            tvGenres = try await networkManager.fetch(url: MovieDbRouter.getTvGenres.urlString, expecting: GenreModel.self)
        } catch {
            print(error)
        }
    }
    
    func getTvSerieDetail(id: Int) async {
        do {
            tvSerieDetail = try await networkManager.fetch(url: MovieDbRouter.getTvSerieDetail(id: id).urlString, expecting: TvSerieDetailModel.self)
            isActive = true
        } catch {
            print(error)
        }
    }
    
    func getTvSerieCredit(id: Int) async {
        do {
            tvSerieCast = try await networkManager.fetch(url: MovieDbRouter.getTvSerieCredit(id: id).urlString, expecting: TvSerieCastModel.self)
        } catch {
            print(error)
        }
    }
}
