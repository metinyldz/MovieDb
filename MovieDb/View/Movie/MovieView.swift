//
//  MovieView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct MovieView: View {
    
    @StateObject var movieViewModel = MovieViewModel()
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    if let results = movieViewModel.topRatedMovies.results,
                       let moviesResults = movieViewModel.movies.results,
                       let genres = movieViewModel.genres.genres {
                        
                        //MARK: - HEADER -
                        MovieHeaderView(movieTopRatedResult: results)
                            .environmentObject(contentBindigs)
                        
                        //MARK: - CENTER -
                        
                        MovieDescriptionView(rating: results[contentBindigs.moviePageIndex].vote_average,
                                             movie: results[contentBindigs.moviePageIndex],
                                             genres: genres)
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
                        
                        ForEach(moviesResults, id: \.self) { movie in
                            NavigationLink(destination: MovieDetailView(content: movieViewModel.movieDetail), isActive: $movieViewModel.isMovieDetailActive) {
                                PopularCardView(movieResult: movie, isFavorite: getFavoriteItem(movie), genres: genres)
                                    .padding(.vertical, 10)
                                    .environmentObject(contentBindigs)
                                    .onTapGesture {
                                        movieViewModel.getMovieDetail(id: movie.id ?? -1)
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
            movieViewModel.getTopRatedMovies()
            movieViewModel.getMovies()
            movieViewModel.getMoviesGenres()
        }
    }
    
    private func getFavoriteItem(_ movieResult: MovieResult) -> Bool {
        var temp = false
        
        return UserDefaults.standard.favoriteModel.contains { item in
            temp = (item.contentId == movieResult.id ?? -1)
            return temp
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .previewDisplayName("iPhone 12 Mini")
            .preferredColorScheme(.light)
            .environmentObject(ContentBindigs())
    }
}
