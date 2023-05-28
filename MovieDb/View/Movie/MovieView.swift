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
                        
                        //MARK: - CENTER -
                        
                        MovieDescriptionView(rating: results[contentBindigs.moviePageIndex].vote_average,
                                             movie: results[contentBindigs.moviePageIndex],
                                             genres: genres)
                        
                        Divider()
                            .padding(.horizontal, 24)
                            .padding(.vertical, 20)
                        
                        //MARK: - FOOTER -
                        
                        MovieViewFooter(moviesResults: moviesResults, genres: genres)
                    }
                } //: SCROLL
            } //: ZStack
            .navigationBarTitle("Movies", displayMode: .large)
            .navigationViewStyle(.stack)
            .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
        } //: NAVIGATION
        .task {
            await movieViewModel.getTopRatedMovies()
            await movieViewModel.getMovies()
            await movieViewModel.getMoviesGenres()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .environmentObject(ContentBindigs())
            .preferredColorScheme(.light)
    }
}
