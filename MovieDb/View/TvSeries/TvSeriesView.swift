//
//  TvSeriesView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct TvSeriesView: View {
    
    @StateObject var viewModel = TvSeriesViewModel()
    @StateObject var contentBindigs = ContentBindigs()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    
                    if let results = viewModel.tvTopRated.results,
                       let tvSeriesResults = viewModel.tvSeries.results,
                       let genres = viewModel.tvGenres.genres {
                        
                        //MARK: - HEADER -
                        
                        TvHeaderView(tvTopRatedResult: results)
                            .environmentObject(contentBindigs)
                        
                        //MARK: - CENTER -
                        
                        TvDescriptionView(rating: results[contentBindigs.tvPageIndex].vote_average,
                                          tv: results[contentBindigs.tvPageIndex],
                                          genres: genres)
                        .padding(.horizontal, 24)
                        
                        Divider()
                            .padding(.horizontal, 24)
                            .padding(.vertical, 20)
                        
                        //MARK: - FOOTER -
                        
                        VStack {
                            Text("Top Rated")
                                .font(Font.system(size: 22))
                                .fontWeight(.bold)
                        } //: VSTACK
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 10)
                        
                        TvSeriesCardView(tvResults: tvSeriesResults)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 2, y: 2)
                            .environmentObject(contentBindigs)
                    }
                } //: SCROLL
                .navigationBarTitle("TV Series", displayMode: .large)
                .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
            } //: ZSTACK
        } //: NAVIGATION
        .onAppear {
            viewModel.getTvTopRated()
            viewModel.getTvSeries()
            viewModel.getTvGenres()
        }
    }
}

struct TvSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesView()
            .previewDisplayName("iPhone 12 Mini")
            .preferredColorScheme(.light)
    }
}
