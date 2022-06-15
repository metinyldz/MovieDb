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
    @State private var isMovieDetailActive = false
    @State var movieTopRatedResult: [MovieTopRatedResult] = []
    @State var movieResult: [MovieResult] = []
    @State var movieDetailContent = MovieDetailModel()
    
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    if isMovieTopRatedActive && isMovieResultActive {
                        //MARK: - HEADER -
                        MovieHeaderView(movieTopRatedResult: $movieTopRatedResult)
                            .environmentObject(contentBindigs)
                        
                        //MARK: - CENTER -
                        
                        MovieDescriptionView(rating: $movieTopRatedResult[contentBindigs.moviePageIndex].vote_average,
                                             movie: $movieTopRatedResult[contentBindigs.moviePageIndex],
                                             movieGenres: $movieTopRatedResult[contentBindigs.moviePageIndex].genre_ids)
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
                            NavigationLink(destination: MovieDetailView(content: $movieDetailContent), isActive: $isMovieDetailActive) {
                                PopularCardView(movieResult: movie, isFavorite: getFavoriteItem(movie))
                                    .padding(.vertical, 10)
                                    .environmentObject(contentBindigs)
                                    .onTapGesture {
                                        self.fetchMovieDetail(id: movie.id ?? -1)
                                    }
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
            fetchMovieTopRatedData()
        }
    }

    private func getFavoriteItem(_ movieResult: MovieResult) -> Bool {
        var temp = false
        
        return UserDefaults.standard.favoriteModel.contains { item in
            temp = (item.contentId == movieResult.id ?? -1)
            return temp
        }
    }

    private func fetchMovieTopRatedData() {
        movieViewModel.fetchMovieTopRated { result, success in
            guard let result = result else { return }
            movieTopRatedResult = result
            fetchMoviesData()
        }
    }
    
    private func fetchMoviesData() {
        movieViewModel.fetchMovies { result, success in
            guard let result = result else { return }
            movieResult = result
            fetchMoviesGenresData()
        }
    }
    
    private func fetchMoviesGenresData() {
        movieViewModel.fetchMovieGenres { result, success in
            guard let result = result else { return }
            GenreModel.movieInstance = result
            isMovieTopRatedActive = true
            isMovieResultActive = true
        }
    }
    
    private func fetchMovieDetail(id: Int) {
        movieViewModel.fetchMovieDetail(id: id) { result, success in
            if success {
                self.movieDetailContent = result!
            }
            isMovieDetailActive = success
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
        MovieView(movieDetailContent: MovieDetailModel.all())
            .previewDisplayName("iPhone 12 Mini")
            .preferredColorScheme(.light)
            .environmentObject(ContentBindigs())
    }
}
