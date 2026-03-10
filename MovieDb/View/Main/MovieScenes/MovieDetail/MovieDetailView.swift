//
//  MovieDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct MovieDetailView: View {
    var id: Int
    
    @StateObject private var viewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .loaded:
                GeometryReader { geometry in
                    ScrollView {
                        if let movieDetail = viewModel.movieDetail {
                            LazyVStack {
                                // MARK: - HEADER -
                                ParallaxHeaderView(
                                    posterPath: movieDetail.poster_path,
                                    width: geometry.size.width
                                )
                                
                                // MARK: - CENTER -
                                MovieDetailCenterView(content: movieDetail)
                                    .padding(.top, -20)
                                
                                // MARK: - FOOTER -
                                MovieDetailFooterView(content: movieDetail)
                                    .padding(.horizontal, 24)
                            }
                        }
                    }
                    .background(Color("BackgroundColor"))
                    .navigationBarHidden(true)
                }
            case .error:
                EmptyView()
            }
        }
        .navigationBarHidden(true)
        .onFirstAppear {
            Task {
                viewModel.viewState = .loading
                do {
                    let detail = try await viewModel.getMovieDetail(id: id)
                    viewModel.movieDetail = detail
                    viewModel.viewState = .loaded
                } catch {
                    viewModel.viewState = .error(error)
                }
            }
        }
    }
}

#Preview {
    MovieDetailView(id: 550)
}
