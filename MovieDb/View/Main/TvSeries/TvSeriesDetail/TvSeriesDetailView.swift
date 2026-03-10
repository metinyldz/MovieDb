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
        .backButton()
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
            GeometryReader { imageGeometry in
                let global = imageGeometry.frame(in: .global)
                
                CachedAsyncImage(
                    posterPath: "https://image.tmdb.org/t/p/w500\(tvSerieDetail.poster_path ?? "")",
                    contentMode: .fill
                ) {
                    Image("moviePlaceholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width,
                               height: global.minY > 0 ? max(400, global.minY + 400) : 400)
                        .clipped()
                        .offset(y: global.minY > 0 ? -global.minY : 0)
                }
                .frame(width: geometry.size.width,
                       height: global.minY > 0 ? max(400, global.minY + 400) : 400)
                .clipped()
                .offset(y: global.minY > 0 ? -global.minY : 0)
            }
            .frame(height: 400)
            
            TvSeriesDetailCenterView(content: tvSerieDetail)
                .padding(.top, -12)
            
            TvSeriesDetailFooterView(content: tvSerieDetail, cast: tvSerieCast)
        }
    }
}

#Preview {
    TvSeriesDetailView(id: -1)
}
