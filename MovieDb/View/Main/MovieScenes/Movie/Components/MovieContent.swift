//
//  MovieContent.swift
//  MovieDb
//
//  Created by Metin Yıldız on 25.01.2026.
//

import SwiftUI

struct MovieContent: View {
    @ObservedObject var viewModel: MovieViewModel
    
    var body: some View {
        switch viewModel.viewState {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView()
                .tint(Color("VibrantBlue"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        case .loaded:
            ScrollView(showsIndicators: false) {
                VStack(spacing: .zero) {
                    Color("VibrantBlue")
                        .frame(height: 300)
                    
                    MovieHorizontalTopRatedList()
                        .padding(.top, -130)
                    
                    Divider()
                        .padding()
                        .padding(.top, 20)
                    
                    MoviePopularList()
                        .padding(.horizontal, 24)
                }
            }
            .ignoresSafeArea(.all)
            .navigationTitle("Movies")
        case .error:
            EmptyView()
        }
    }
}
