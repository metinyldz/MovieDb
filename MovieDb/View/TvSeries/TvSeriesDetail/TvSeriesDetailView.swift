//
//  TvSeriesDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 14.05.2022.
//

import SwiftUI

struct TvSeriesDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var id: Int
    
    //MARK: - PROPERTIES -
    @State var tvSerieDetailModel: TvSerieDetailModel?
    @State var tvSerieCastModel: TvSerieCastModel?
    @State private var isLoading = true
    
    @StateObject var viewModel = TvSeriesViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let tvSerieDetail = tvSerieDetailModel,
                          let tvSerieCast = tvSerieCastModel {
                    VStack {
                        GeometryReader { imageGeometry in
                            let global = imageGeometry.frame(in: .global)
                            
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tvSerieDetail.poster_path ?? "")")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width,
                                           height: global.minY > 0 ? max(400, global.minY + 400) : 400)
                                    .clipped()
                                    .offset(y: global.minY > 0 ? -global.minY : 0)
                            } placeholder: {
                                Image("moviePlaceholder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width,
                                           height: global.minY > 0 ? max(400, global.minY + 400) : 400)
                                    .clipped()
                                    .offset(y: global.minY > 0 ? -global.minY : 0)
                            }
                        }
                        .frame(height: 400)
                        .overlay(
                            Image(systemName: "arrow.left")
                                .foregroundColor(Color.white)
                                .frame(width: 25, height: 25)
                                .onTapGesture {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                .padding(32)
                            ,
                            alignment: .topLeading
                        )
                        
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
                        tvSerieCastModel = model
                    }
                    await viewModel.getTvSerieDetail(id: id) { model in
                        tvSerieDetailModel = model
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
