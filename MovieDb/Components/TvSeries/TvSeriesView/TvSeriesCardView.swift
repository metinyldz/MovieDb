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
    
    var body: some View {
        if let results = tvResults {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(results, id: \.self) { result in
                    NavigationLink(destination: TvSeriesDetailView(tvSerieDetailModel: viewModel.tvSerieDetail, tvSerieCastModel: viewModel.tvSerieCast), isActive: $viewModel.isActive) {
                        TvSeriesSingleCardView(tvResult: result, isFavorite: getFavoriteItem(result))
                            .onTapGesture {
                                Task {
                                    await viewModel.getTvSerieCredit(id: result.id ?? -1)
                                    await viewModel.getTvSerieDetail(id: result.id ?? -1)
                                }
                            }
                    }
                } //: FOREACH
            } //: LAZYVGRID
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

struct TvSeriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesCardView()
            .previewLayout(.fixed(width: 375, height: 530))
            .padding()
            .background(Color.gray)
        
    }
}
