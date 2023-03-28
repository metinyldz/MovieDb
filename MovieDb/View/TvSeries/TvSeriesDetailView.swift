//
//  TvSeriesDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 14.05.2022.
//

import SwiftUI

struct TvSeriesDetailView: View {
    
    //MARK: - PROPERTIES -
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var tvSerieDetailModel: TvSerieDetailModel?
    var tvSerieCastModel: TvSerieCastModel?
    
    var body: some View {
        ScrollView {
            
            if let tvSerieDetail = tvSerieDetailModel, let tvSerieCast = tvSerieCastModel {
                //MARK: - HEADER -
                
                VStack {
                    ZStack {
                        GeometryReader { proxy in
                            let global = proxy.frame(in: .global)
                            // Header
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tvSerieDetail.poster_path ?? "")")) { image in
                                image
                                    .resizable()
                                    .offset(y: global.minY > 0 ? -global.minY : 0)
                                    .frame(height: global.minY > 0 ? (400) + global.minY :  400)
                            } placeholder: {
                                Image("moviePlaceholder")
                                    .resizable()
                                    .offset(y: global.minY > 0 ? -global.minY : 0)
                                    .frame(height: global.minY > 0 ? (400) + global.minY :  400)
                            }
                        }
                        .frame(height: 400)
                        
                        VStack {
                            HStack {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(Color.white)
                                    .frame(width: 25, height: 25)
                                    .onTapGesture {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                    .padding([.leading, .trailing], 24)
                                
                                Spacer()
                            } //: HStack
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            
                            Spacer()
                        } //: VStack
                    } //: ZStack
                    
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

struct TvSeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesDetailView()
    }
}
