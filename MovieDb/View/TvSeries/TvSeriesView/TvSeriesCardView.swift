//
//  TvSeriesCardView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct TvSeriesCardView: View {
    var columns: [GridItem] = [
        GridItem(.fixed(153)),
        GridItem(.fixed(153))
    ]
    
    @ObservedObject var tvViewModel = TvViewModel()
    
    @State var tvResults: [TvSeriesResult]
    @State private var isActive = false
    
    @EnvironmentObject var contentBindigs: ContentBindigs
    @State var tvSerieDetailModel = TvSerieDetailModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(tvResults, id: \.self) { tvResult in
                    NavigationLink(destination: TvSeriesDetailView(tvSerieDetailModel: $tvSerieDetailModel), isActive: $isActive) {
                        TvSeriesSingleCardView(tvResult: tvResult, isFavorite: getFavoriteItem(tvResult))
                            .environmentObject(contentBindigs)
                            .onTapGesture {
                                fetchTvSerieDetail(id: tvResult.id ?? -1)
                            }
                    }
                } //: FOREACH
            } //: LAZYVGRID
            .padding(.bottom, 10)
        } //: SCROLL
    }
    
    private func getFavoriteItem(_ tvResult: TvSeriesResult) -> Bool {
        var temp = false
        
        return UserDefaults.standard.favoriteModel.contains { item in
            temp = (item.contentId == tvResult.id ?? -1)
            return temp
        }
    }
    
    private func fetchTvSerieDetail(id: Int) {
        tvViewModel.fetchTvSerieDetail(id: id) { result, success in
            guard let result = result else { return }
            if success {
                tvSerieDetailModel = result
            }
            isActive = success
        }
    }
}

struct TvSeriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesCardView(tvResults: TvSeriesResult.all(), tvSerieDetailModel: TvSerieDetailModel.all())
            .previewLayout(.fixed(width: 375, height: 530))
            .padding()
            .background(Color.gray)
        
    }
}
