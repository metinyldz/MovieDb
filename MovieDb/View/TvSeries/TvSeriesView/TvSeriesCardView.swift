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
    
    @State var tvResults: [TvSeriesResult]
    @State private var isActive = false
    
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(tvResults, id: \.self) { tvResult in
                    NavigationLink(destination: TvSeriesDetailView(), isActive: $isActive) {
                        TvSeriesSingleCardView(tvResult: tvResult, isFavorite: getFavoriteItem(tvResult))
                            .environmentObject(contentBindigs)
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
}

struct TvSeriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesCardView(tvResults: TvSeriesResult.all())
            .previewLayout(.fixed(width: 375, height: 530))
            .padding()
            .background(Color.gray)
        
    }
}
