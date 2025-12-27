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
    
    // MARK: - Loading State
    
    enum LoadingState {
        case idle
        case loading
        case success
        case failure(Error)
        
        var isLoading: Bool {
            if case .loading = self { return true }
            return false
        }
        
        var error: Error? {
            if case .failure(let error) = self { return error }
            return nil
        }
        
        var isOfflineError: Bool {
            if case .failure(let error) = self {
                return error.isOfflineError
            }
            return false
        }
    }
    
    // MARK: - Published Properties
    
    @Published var tvSeries: TvSeriesModel = TvSeriesModel()
    @Published var tvTopRated: TvTopRatedModel = TvTopRatedModel()
    @Published var tvGenres: GenreModel = GenreModel()
    @Published var tvSerieDetail: TvSerieDetailModel = TvSerieDetailModel()
    @Published var tvSerieCast: TvSerieCastModel = TvSerieCastModel()
    @Published var isActive = false
    @Published var loadingState: LoadingState = .idle
    @Published var retryCount = 0
    
    var networkManager = NetworkManager()
    
    private let screenName = "TVSeriesScreen"
    
    // MARK: - Data Loading
    
    func loadAllData() async {
        let startTime = Date()
        loadingState = .loading
        
        AnalyticsManager.log(event: .screenViewed(screenName))
        
        do {
            try await withThrowingTaskGroup(of: Void.self) { group in
                group.addTask { [weak self] in
                    guard let self else { return }
                    try await self.getTvTopRated()
                }
                
                group.addTask { [weak self] in
                    guard let self else { return }
                    try await self.getTvSeries()
                }
                
                group.addTask { [weak self] in
                    guard let self else { return }
                    try await self.getTvGenres()
                }
                
                try await group.waitForAll()
            }
            
            let duration = Date().timeIntervalSince(startTime)
            
            AnalyticsManager.log(event: .apiCall(
                endpoint: "getAllTVData",
                success: true,
                duration: duration
            ))
            
            loadingState = .success
            retryCount = 0
            
        } catch {
            let duration = Date().timeIntervalSince(startTime)
            
            AnalyticsManager.logError(
                error,
                screen: screenName,
                additionalInfo: [
                    "retryCount": retryCount,
                    "duration": duration
                ]
            )
            
            AnalyticsManager.log(event: .apiCall(
                endpoint: "getAllTVData",
                success: false,
                duration: duration
            ))
            
            loadingState = .failure(error)
            print("❌ Error loading TV series data: \(error)")
        }
    }
    
    func retry() {
        retryCount += 1
        
        AnalyticsManager.log(event: .retryAttempt(
            screen: screenName,
            attemptNumber: retryCount
        ))
        
        AnalyticsManager.log(event: .userAction(
            "RetryButtonTapped",
            parameters: ["attemptNumber": retryCount]
        ))
        
        Task {
            await loadAllData()
        }
    }
    
    func getTvSeries() async throws {
        tvSeries = try await networkManager.fetch(url: MovieDbRouter.getTvSeries.urlString, expecting: TvSeriesModel.self)
    }
    
    func getTvTopRated() async throws {
        tvTopRated = try await networkManager.fetch(url: MovieDbRouter.getTvTopRated.urlString, expecting: TvTopRatedModel.self)
    }
    
    func getTvGenres() async throws {
        tvGenres = try await networkManager.fetch(url: MovieDbRouter.getTvGenres.urlString, expecting: GenreModel.self)
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
