//
//  SplashView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 28.05.2022.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var splashViewModel = SplashViewModel()
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                ContentView()
            } else {
                SplashFinalView()
            }
        } //: VSTACK
        .onAppear {
            withAnimation {
                fetchMovieGenres()
            }
        }
    }
    
    private func fetchMovieGenres() {
        splashViewModel.fetchMovieGenres { result, success in
            if success {
                GenreModel.movieInstance = result!
                fetchTvGenres()
            }
        }
    }
    
    private func fetchTvGenres() {
        splashViewModel.fetchTvGenres { result, success in
            if success {
                GenreModel.tvInstance = result!
                isActive = true
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewDevice("iPhone 12 Mini")
    }
}
