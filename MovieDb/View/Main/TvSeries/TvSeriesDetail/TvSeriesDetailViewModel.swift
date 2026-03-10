//
//  TvSeriesDetailViewModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 27.12.2021.
//

import Foundation

@MainActor
class TvSeriesDetailViewModel: BaseViewModel {
    @Published var viewState: ViewState = .idle
    
    var tvSerieDetail: TvSerieDetailModel? = TvSerieDetailModel()
    var tvSerieCast: TvSerieCastModel? = TvSerieCastModel()
    
    var networkManager = NetworkManager()
    
    func getTvSerieDetail(id: Int) async throws -> TvSerieDetailModel {
        do {
            let result = try await networkManager.fetch(url: MovieDbRouter.getTvSerieDetail(id: id).urlString, expecting: TvSerieDetailModel.self)
            tvSerieDetail = result
            return result
        } catch {
            print(error)
            throw error
        }
    }
    
    func getTvSerieCredit(id: Int) async throws -> TvSerieCastModel {
        do {
            let result = try await networkManager.fetch(url: MovieDbRouter.getTvSerieCredit(id: id).urlString, expecting: TvSerieCastModel.self)
            tvSerieCast = result
            return result
        } catch {
            print(error)
            throw error
        }
    }
    
    enum ViewState {
        case idle
        case loading
        case loaded
        case error(Error)
    }
}
