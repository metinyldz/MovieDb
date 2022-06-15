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
    @Binding var tvSerieDetailModel: TvSerieDetailModel
    
    var body: some View {
        ScrollView {
            
            //MARK: - HEADER -
            
            VStack {
                ZStack {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tvSerieDetailModel.poster_path ?? "")")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 400)
                            .clipped()
                            .padding(.top, -50)
                    } placeholder: {
                        Image("moviePlaceholder")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 400)
                            .clipped()
                            .padding(.top, -50)
                    }
                    
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
                
                TvSeriesDetailCenterView(content: tvSerieDetailModel)
                    .padding(.top, -24)
                
                //MARK: - FOOTER -
                
                TvSeriesDetailFooterView(content: tvSerieDetailModel)
                
            } //: VStack
        } //: SCROLL
        .background(Color("BackgroundColor"))
        .navigationBarHidden(true)
    }
}

struct TvSeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesDetailView(tvSerieDetailModel: .constant(TvSerieDetailModel.all()))
    }
}
