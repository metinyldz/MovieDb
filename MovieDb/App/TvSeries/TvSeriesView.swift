//
//  TvSeriesView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct TvSeriesView: View {
    
    @ObservedObject var tvViewModel = TvViewModel()
    @State private var isTvTopRatedActive = false
    @State private var isTvResultActive = false
    
    @State private var tvTopRatedResult: [TvTopRatedResult] = []
    @State private var tvSeriesResult: [TvSeriesResult] = []
    
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    if isTvTopRatedActive && isTvResultActive {
                        //MARK: - HEADER -
                        
                        TvHeaderView(tvTopRatedResult: tvTopRatedResult)
                            .environmentObject(contentBindigs)
                        
                        //MARK: - CENTER -
                        
                        TvDescriptionView(rating: $tvTopRatedResult[contentBindigs.tvPageIndex].vote_average,
                                          tv: $tvTopRatedResult[contentBindigs.tvPageIndex],
                                          tvGenres: $tvTopRatedResult[contentBindigs.tvPageIndex].genre_ids)
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
                        
                        // TODO: TableView Yap. -
                        
                        TvSeriesCardView(tvResults: tvSeriesResult)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 2, y: 2)
                    }
                } //: SCROLL
                .navigationBarTitle("TV Series", displayMode: .large)
                .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
            } //: ZSTACK
        } //: NAVIGATION
        .onAppear {
            fetchTvTopRatedData()
        }
    }
    
    private func fetchTvTopRatedData() {
        tvViewModel.fetchTvTopRated { result, success in
            guard let result = result else { return }
            tvTopRatedResult = result
            fetchTvSeriesData()
        }
    }
    
    private func fetchTvSeriesData() {
        tvViewModel.fetchTvSeries { result, success in
            guard let result = result else { return }
            tvSeriesResult = result
            fetchTvGenreData()
        }
    }
    
    private func fetchTvGenreData() {
        tvViewModel.fetchTvGenres { result, success in
            guard let result = result else { return }
            GenreModel.tvInstance = result
            isTvTopRatedActive = true
            isTvResultActive = true
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
