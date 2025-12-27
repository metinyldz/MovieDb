//
//  TvSeriesView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct TvSeriesView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = TvSeriesViewModel()
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    // MARK: - Constants
    
    private enum Constants {
        static let horizontalPadding: CGFloat = 24
        static let dividerVerticalPadding: CGFloat = 20
        static let cardBottomPadding: CGFloat = 10
        static let sectionTitleFontSize: CGFloat = 22
        static let shadowRadius: CGFloat = 8
        static let shadowOffset: CGFloat = 2
        static let shadowOpacity: CGFloat = 0.15
    }
    
    // MARK: - Computed Properties
    
    private var isDataLoaded: Bool {
        viewModel.tvTopRated.results != nil &&
        viewModel.tvSeries.results != nil &&
        viewModel.tvGenres.genres != nil
    }
    
    private var isLoading: Bool {
        viewModel.loadingState.isLoading
    }
    
    private var loadingError: Error? {
        viewModel.loadingState.error
    }
    
    private var isOfflineError: Bool {
        viewModel.loadingState.isOfflineError
    }
    
    private var currentTvShow: TvTopRatedResult? {
        guard let results = viewModel.tvTopRated.results,
              contentBindigs.tvPageIndex < results.count else {
            return nil
        }
        return results[contentBindigs.tvPageIndex]
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundView
                contentScrollView
            }
            .navigationBarTitle("TV Series", displayMode: .large)
            .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
        }
        .onFirstAppear {
            loadData()
        }
    }
    
    // MARK: - View Components
    
    private var backgroundView: some View {
        Color("BackgroundColor")
            .ignoresSafeArea(.all, edges: .all)
    }
    
    private var contentScrollView: some View {
        ScrollView(showsIndicators: false) {
            if isLoading {
                loadingView
            } else if isOfflineError {
                OfflineModeView(onRetry: {
                    loadData()
                })
            } else if let error = loadingError {
                errorView(error: error)
            } else if isDataLoaded {
                mainContent
            } else {
                emptyStateView
            }
        }
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if let results = viewModel.tvTopRated.results,
           let tvSeriesResults = viewModel.tvSeries.results,
           let genres = viewModel.tvGenres.genres,
           let currentShow = currentTvShow {
            
            VStack(spacing: 0) {
                headerSection(results: results)
                descriptionSection(currentShow: currentShow, genres: genres)
                sectionDivider
                topRatedSection
                topRatedCardsSection(tvSeriesResults: tvSeriesResults)
            }
        }
    }
    
    // MARK: - Section Views
    
    private var loadingView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.5)
                .tint(Color("VibrantBlue"))
            
            Text("Loading TV Series...")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 100)
    }
    
    private func errorView(error: Error) -> some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text("Oops! Something went wrong")
                .font(.title2)
                .fontWeight(.bold)
            
            Text(error.localizedDescription)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Constants.horizontalPadding)
            
            Button(action: {
                AnalyticsManager.log(event: .userAction(
                    "ErrorRetryButtonTapped",
                    parameters: [
                        "screen": "TVSeries",
                        "errorType": String(describing: type(of: error)),
                        "retryCount": viewModel.retryCount
                    ]
                ))
                loadData()
            }) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Try Again")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color("VibrantBlue"))
                .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 100)
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "tv.slash")
                .font(.system(size: 50))
                .foregroundColor(.secondary)
            
            Text("No TV Series Available")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 100)
    }
    
    private func headerSection(results: [TvTopRatedResult]) -> some View {
        TvHeaderView(tvTopRatedResult: results)
    }
    
    private func descriptionSection(currentShow: TvTopRatedResult, genres: [GenreResult]) -> some View {
        TvDescriptionView(
            rating: currentShow.vote_average,
            tv: currentShow,
            genres: genres
        )
        .padding(.horizontal, Constants.horizontalPadding)
    }
    
    private var sectionDivider: some View {
        Divider()
            .padding(.horizontal, Constants.horizontalPadding)
            .padding(.vertical, Constants.dividerVerticalPadding)
    }
    
    private var topRatedSection: some View {
        Text("Top Rated")
            .font(.system(size: Constants.sectionTitleFontSize))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, Constants.horizontalPadding)
            .padding(.bottom, Constants.cardBottomPadding)
    }
    
    private func topRatedCardsSection(tvSeriesResults: [TvSeriesResult]) -> some View {
        TvSeriesCardView(tvResults: tvSeriesResults)
            .padding(.horizontal, Constants.horizontalPadding)
            .padding(.bottom, Constants.cardBottomPadding)
            .shadow(
                color: .black.opacity(Constants.shadowOpacity),
                radius: Constants.shadowRadius,
                x: Constants.shadowOffset,
                y: Constants.shadowOffset
            )
    }
    
    // MARK: - Methods
    
    private func loadData() {
        Task {
            await viewModel.loadAllData()
        }
    }
}

// MARK: - Preview

#Preview {
    TvSeriesView()
        .environmentObject(ContentBindigs())
        .preferredColorScheme(.light)
}
