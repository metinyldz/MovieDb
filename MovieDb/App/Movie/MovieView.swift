//
//  MovieView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct MovieView: View {
    
    @ObservedObject var movieViewModel = MovieViewModel()
    @State private var isMovieTopRatedActive = false
    @State private var isMovieResultActive = false
    
    @State private var isActive = false
    @State var movieTopRatedResult: [MovieTopRatedResult] = []
    @State var movieResult: [MovieResult] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    
                    if isMovieTopRatedActive && isMovieResultActive {
                        //MARK: - HEADER -
                        MovieHeaderView(movieTopRatedResult: movieTopRatedResult)
                        
                        //MARK: - CENTER -
                        
                        MovieDescriptionView()
                            .padding(.horizontal, 24)
                        
                        Divider()
                            .padding(.horizontal, 24)
                            .padding(.vertical, 20)
                        
                        //MARK: - FOOTER -
                        
                        VStack {
                            Text("Popular")
                                .font(Font.system(size: 22))
                                .fontWeight(.bold)
                        } //: VSTACK
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 10)
                        
                        ForEach(movieResult, id: \.self) { movie in
                            NavigationLink(destination: MovieDetailView(), isActive: $isActive) {
                                PopularCardView(movieResult: movie)
                                    .padding(.vertical, 10)
                            } //: LINK
                        } //: LOOP
                    }
                } //: SCROLL
                .navigationBarTitle("Movies", displayMode: .large)
                .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
            } //: ZStack
            .navigationViewStyle(.stack)
        } //: NAVIGATION
        .onAppear {
            // TODO: - Fetch Data -
            fetchMovieTopRatedData()
            fetchMoviesData()
        }
    }
    
    private func fetchMovieTopRatedData() {
        movieViewModel.fetchMovieTopRated { result, success in
            guard let result = result else { return }
            self.movieTopRatedResult = result
            self.isMovieTopRatedActive = true
        }
    }
    
    private func fetchMoviesData() {
        movieViewModel.fetchMovies { result, success in
            guard let result = result else { return }
            self.movieResult = result
            self.isMovieResultActive = true
        }
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .previewDisplayName("iPhone 12 Mini")
            .preferredColorScheme(.light)
    }
}
