//
//  TVSeriesContentView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.01.2026.
//

import SwiftUI

struct TVSeriesContentView: View {
    
    // MARK: - Properties
    @EnvironmentObject var contentBindigs: ContentBindigs
    @ObservedObject var viewModel: TvSeriesViewModel
    
    var retryRequest: () -> Void
    
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
    
    private var currentTvShow: TvTopRatedResult? {
        guard let results = viewModel.tvTopRated.results,
              contentBindigs.tvPageIndex < results.count else {
            return nil
        }
        return results[contentBindigs.tvPageIndex]
    }
    
    var body: some View {
        switch viewModel.loadingState {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView().tint(Color("VibrantBlue"))
        case .loaded:
            mainContent
        case .failure(let error):
            TvSeriesErrorView(
                error: error,
                retryCount: $viewModel.retryCount) {
                    retryRequest()
                }
        }
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if let results = viewModel.tvTopRated.results,
           let tvSeriesResults = viewModel.tvSeries.results,
           let genres = viewModel.tvGenres.genres,
           let currentShow = currentTvShow {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    headerSection(results: results)
                    descriptionSection(currentShow: currentShow, genres: genres)
                    sectionDivider
                    topRatedSection
                    topRatedCardsSection(tvSeriesResults: tvSeriesResults)
                }
            }
        }
    }
    
    // MARK: - Section Views
    
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
}
