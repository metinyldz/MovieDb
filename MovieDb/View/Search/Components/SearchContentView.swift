//
//  SearchContentView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.01.2026.
//

import SwiftUI

struct SearchContentView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    @Binding var isEditing: Bool
    
    var body: some View {
        switch viewModel.searchState {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView().tint(Color("VibrantBlue"))
        case .loaded(let response):
            if let result = response?.results {
                SearchLoadedContentView(
                    searchText: $searchText,
                    isEditing: $isEditing,
                    searchResults: result
                )
            } else {
                SearchLoadedContentView(
                    searchText: $searchText,
                    isEditing: $isEditing
                )
            }
        case .failure(let _):
            EmptyView()
        }
    }
}

#Preview {
    SearchContentView(
        viewModel: SearchViewModel(),
        searchText: .constant(""),
        isEditing: .constant(false)
    )
}
