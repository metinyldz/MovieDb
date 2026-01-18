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
    
    var tvResults: [TvSeriesResult]?
    
    @StateObject var viewModel = TvSeriesViewModel()
    @State private var isActive = false
    @EnvironmentObject var contentBindigs: ContentBindigs
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        if let results = tvResults {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(results, id: \.self) { result in
                    TvSeriesSingleCardView(tvResult: result, isFavorite: getFavoriteItem(result))
                        .onTapGesture {
                            if let id = result.id {
                                navigationManager.navigate(to: .tvSeriesDetail(id: id))
                            }
                        }
                }
            }
            .padding(.bottom, 10)
        }
    }
    
    private func getFavoriteItem(_ tvResult: TvSeriesResult) -> Bool {
        var temp = false
        
        return UserDefaults.standard.favoriteModel.contains { item in
            temp = (item.contentId == tvResult.id ?? -1)
            return temp
        }
    }
}

#Preview {
    TvSeriesCardView()
        .background(Color.gray)
}
