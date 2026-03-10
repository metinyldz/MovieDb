//
//  TvSeriesDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 14.05.2022.
//

import SwiftUI

struct TvSeriesDetailView: View {
    var id: Int
    
    //MARK: - PROPERTIES -
    @StateObject private var viewModel = TvSeriesDetailViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .loaded:
                GeometryReader { geometry in
                    ScrollView {
                        if let tvSerieDetail = viewModel.tvSerieDetail,
                           let tvSerieCast = viewModel.tvSerieCast {
                            contentView(
                                tvSerieDetail: tvSerieDetail,
                                tvSerieCast: tvSerieCast,
                                geometry: geometry
                            )
                        }
                    }
                    .background(Color("BackgroundColor"))
                    .navigationBarHidden(true)
                }
            case .error:
                EmptyView()
            }
        }
        .navigationBarHidden(true)
        .onFirstAppear {
            Task {
                viewModel.viewState = .loading
                do {
                    async let credit = viewModel.getTvSerieCredit(id: id)
                    async let detail = viewModel.getTvSerieDetail(id: id)
                    
                    let (creditModel, detailModel) = try await (credit, detail)
                    
                    viewModel.tvSerieCast = creditModel
                    viewModel.tvSerieDetail = detailModel
                    viewModel.viewState = .loaded
                } catch {
                    viewModel.viewState = .error(error)
                }
            }
        }
    }
    
    func contentView(
        tvSerieDetail: TvSerieDetailModel,
        tvSerieCast: TvSerieCastModel,
        geometry: GeometryProxy
    ) -> some View {
        VStack {
            ParallaxHeaderView(
                posterPath: tvSerieDetail.poster_path,
                width: geometry.size.width
            )
            
            TvSeriesDetailCenterView(content: tvSerieDetail)
                .padding(.top, -12)
            
            TvSeriesDetailFooterView(content: tvSerieDetail, cast: tvSerieCast)
        }
    }
}

#Preview {
    TvSeriesDetailView(id: -1)
}
