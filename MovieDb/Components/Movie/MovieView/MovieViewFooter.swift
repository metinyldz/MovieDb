//
//  MovieViewFooter.swift
//  MovieDb
//
//  Created by Metin Yıldız on 12.02.2023.
//

import SwiftUI

struct MovieViewFooter: View {
    @StateObject var movieViewModel = MovieViewModel()
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var moviesResults: [MovieResult]
    var genres: [GenreResult]
    
    var body: some View {
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
                    .onTapGesture {
                        Task {
                            await movieViewModel.getMovieDetail(id: movie.id ?? -1)
                        }
                        
                    }
            } //: LINK
        } //: LOOP
    }
    
    private func getFavoriteItem(_ movieResult: MovieResult) -> Bool {
        var temp = false
        
        return UserDefaults.standard.favoriteModel.contains { item in
            temp = (item.contentId == movieResult.id ?? -1)
            return temp
        }
    }
}


struct MovieViewFooter_Previews: PreviewProvider {
    static var previews: some View {
        MovieViewFooter(moviesResults: MovieResult.all(), genres: [GenreResult(id: 1, name: "asd")])
            .preferredColorScheme(.light)
    }
}
