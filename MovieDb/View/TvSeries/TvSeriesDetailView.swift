//
//  TvSeriesDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 14.05.2022.
//

import SwiftUI

struct TvSeriesDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //MARK: - PROPERTIES -
    var tvSerieDetailModel: TvSerieDetailModel?
    var tvSerieCastModel: TvSerieCastModel?
    
    var body: some View {
        GeometryReader { geometry in
            //let geoGlobal = geometry.frame(in: .global)
            
            ScrollView {
                if let tvSerieDetail = tvSerieDetailModel, let tvSerieCast = tvSerieCastModel {
                    //MARK: - HEADER -
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
                        , alignment: .topLeading)
                        
                        //MARK: - CENTER -
                        
                        TvSeriesDetailCenterView(content: tvSerieDetail)
                            .padding(.top, -12)
                        
                        //MARK: - FOOTER -
                        
                        TvSeriesDetailFooterView(content: tvSerieDetail, cast: tvSerieCast)
                        
                    } //: VStack
                }
            } //: SCROLL
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
        }
    }
}

struct TvSeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesDetailView(tvSerieDetailModel: TvSerieDetailModel.all(), tvSerieCastModel: TvSerieCastModel.all().first)
    }
}
