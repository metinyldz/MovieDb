//
//  SearchView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 17.05.2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    @State var searchText = ""
    @State var searchResults = [SearchMultiContentResult]()
    @State var isActive: Bool = false
    @State private var isEditing = false
    
    var body: some View {
        MainBackgroundContainer {
            SearchContentView(
                viewModel: viewModel,
                searchText: $searchText,
                isEditing: $isEditing
            )
        }
        .navigationBarTitle("Search", displayMode: .large)
        .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
        .onChange(of: searchText) { text in
            if !text.isEmpty && text.count > 3 {
                sendContentRequest()
            }
        }
    }
    
    private func sendContentRequest() {
        if searchText != "" {
            viewModel.fetchSearchContent(queryString: searchText) { result, success in
                guard let result = result else { return }
                isEditing = !result.results.isEmpty
                searchResults = result.results
            }
        }
    }
}

#Preview {
    SearchView()
}
