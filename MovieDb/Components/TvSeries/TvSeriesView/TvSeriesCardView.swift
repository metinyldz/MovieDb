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
        ScrollView(.vertical, showsIndicators: false) {
            if let results = tvResults {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(results, id: \.self) { result in
                        NavigationLink(destination: TvSeriesDetailView(tvSerieDetailModel: viewModel.tvSerieDetail, tvSerieCastModel: viewModel.tvSerieCast), isActive: $viewModel.isActive) {
                            TvSeriesSingleCardView(tvResult: result, isFavorite: getFavoriteItem(result))
                                .environmentObject(contentBindigs)
                                .onTapGesture {
                                    viewModel.getTvSerieCredit(id: result.id ?? -1)
                                    viewModel.getTvSerieDetail(id: result.id ?? -1)
                                }
                        }
                    } //: FOREACH
                } //: LAZYVGRID
                .padding(.bottom, 10)
            }
        } //: SCROLL
    }
    
    private func getFavoriteItem(_ tvResult: TvSeriesResult) -> Bool {
        var temp = false
        
        return UserDefaults.standard.favoriteModel.contains { item in
            temp = (item.contentId == tvResult.id ?? -1)
            return temp
        }
    }
    
    /*private func fetchTvSerieDetail(id: Int) {
        tvSeriesViewModel.fetchTvSerieDetail(id: id) { result, success in
            guard let result = result else { return }
            if success {
                tvSerieDetailModel = result
                fetchTvSerieCredit(id: id)
            }
        }
    }
    
    private func fetchTvSerieCredit(id: Int) {
        tvSeriesViewModel.fetchTvSerieCredit(id: id) { result, success in
            guard let result = result else { return }
            if success {
                tvSerieCastModel = result
            }
            isActive = success
        }
    }*/
}

struct TvSeriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesCardView()
            .previewLayout(.fixed(width: 375, height: 530))
            .padding()
            .background(Color.gray)
        
    }
}
