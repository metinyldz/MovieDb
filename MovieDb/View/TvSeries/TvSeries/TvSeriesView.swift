//
//  TvSeriesView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct TvSeriesView: View {
    
    @StateObject var viewModel = TvSeriesViewModel()
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    if let results = viewModel.tvTopRated.results,
                       let tvSeriesResults = viewModel.tvSeries.results,
                       let genres = viewModel.tvGenres.genres {
                        
                        TvHeaderView(tvTopRatedResult: results)
                        
                        TvDescriptionView(rating: results[contentBindigs.tvPageIndex].vote_average,
                                          tv: results[contentBindigs.tvPageIndex],
                                          genres: genres)
                        .padding(.horizontal, 24)
                        
                        Divider()
                            .padding(.horizontal, 24)
                            .padding(.vertical, 20)
                        
                        VStack {
                            Text("Top Rated")
                                .font(Font.system(size: 22))
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 10)
                        
                        TvSeriesCardView(tvResults: tvSeriesResults)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 2, y: 2)
                    }
                }
                .navigationBarTitle("TV Series", displayMode: .large)
                .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
            }
        }
        .onFirstAppear {
            Task {
                await viewModel.getTvTopRated()
                await viewModel.getTvSeries()
                await viewModel.getTvGenres()
            }
        }
    }
}

struct TvSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesView()
            .environmentObject(ContentBindigs())
            .preferredColorScheme(.light)
    }
}
