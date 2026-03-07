//
//  TvSeriesDetailViewModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 27.12.2021.
//

import Foundation

@MainActor
class TvSeriesDetailViewModel: BaseViewModel {
    // MARK: Content Detail Properties
    var tvSerieDetail: TvSerieDetailModel? = TvSerieDetailModel()
    var tvSerieCast: TvSerieCastModel? = TvSerieCastModel()
    
    var networkManager = NetworkManager()
    
    func getTvSerieDetail(id: Int, completion: @escaping (TvSerieDetailModel?) -> Void) async {
        do {
            tvSerieDetail = try await networkManager.fetch(url: MovieDbRouter.getTvSerieDetail(id: id).urlString, expecting: TvSerieDetailModel.self)
            completion(tvSerieDetail)
        } catch {
            print(error)
        }
    }
    
    func getTvSerieCredit(id: Int, completion: @escaping (TvSerieCastModel?) -> Void) async {
        do {
            tvSerieCast = try await networkManager.fetch(url: MovieDbRouter.getTvSerieCredit(id: id).urlString, expecting: TvSerieCastModel.self)
            completion(tvSerieCast)
        } catch {
            print(error)
        }
    }
}
