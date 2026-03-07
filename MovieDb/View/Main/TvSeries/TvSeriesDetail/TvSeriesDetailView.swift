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
    @State private var isLoading = true
    @StateObject private var viewModel = TvSeriesDetailViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let tvSerieDetail = viewModel.tvSerieDetail,
                          let tvSerieCast = viewModel.tvSerieCast {
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
                            .backButton()
                        }
                        .frame(height: 400)
                        
                        TvSeriesDetailCenterView(content: tvSerieDetail)
                            .padding(.top, -12)
                        
                        TvSeriesDetailFooterView(content: tvSerieDetail, cast: tvSerieCast)
                    }
                }
            }
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
            .onFirstAppear {
                Task {
                    await viewModel.getTvSerieCredit(id: id) { model in
                        viewModel.tvSerieCast = model
                    }
                    await viewModel.getTvSerieDetail(id: id) { model in
                        viewModel.tvSerieDetail = model
                    }
                    isLoading = false
                }
            }
        }
    }
}

#Preview {
    TvSeriesDetailView(id: -1)
}
