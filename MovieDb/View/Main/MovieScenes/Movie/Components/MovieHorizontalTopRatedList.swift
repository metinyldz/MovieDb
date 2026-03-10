//
//  MovieHorizontalTopRatedList.swift
//  MovieDb
//
//  Created by Metin Yıldız on 25.01.2026.
//

import SwiftUI

struct MovieHorizontalTopRatedList: View {
    let movies: [MovieTopRatedResult]
    let genres: [GenreResult]

    @State private var pageIndex = 0
    @EnvironmentObject private var contentBindigs: ContentBindigs

    var body: some View {
        if !movies.isEmpty {
            TabView(selection: $pageIndex) {
                ForEach(Array(movies.enumerated()), id: \.element) { index, movie in
                    imageInformationView(for: movie)
                        .padding(.horizontal, 40)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .frame(height: 470)
            .padding(.vertical, 20)
            .onAppear {
                contentBindigs.moviePageIndex = pageIndex
            }
            .onChange(of: pageIndex) { newValue in
                contentBindigs.moviePageIndex = newValue
            }
        }
    }
    
    private func imageInformationView(for movie: MovieTopRatedResult) -> some View {
        VStack(spacing: 5) {
            CachedAsyncImage(posterPath: movie.poster_path, contentMode: .fill) {
                Image("moviePlaceholder")
                    .resizable()
                    .frame(width: 260, height: 373)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(width: 260, height: 373)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            SmallRatingView(rating: movie.vote_average?.format(f: ".2") ?? "-")
            
            Text(movie.title ?? "-")
                .frame(maxWidth: 300, alignment: .leading)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
            
            Text(genresText(for: movie.genre_ids))
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)
                .fontWeight(.medium)
        }
    }

    private func genresText(for genreIds: [Int]?) -> String {
        guard let genreIds else { return "" }
        let names = genreIds.compactMap { genreId in
            genres.first(where: { $0.id == genreId })?.name
        }
        return names.joined(separator: ", ")
    }
}

struct MovieHorizontalTopRatedList_Previews: PreviewProvider {
    static var previews: some View {
        MovieHorizontalTopRatedList(
            movies: MovieTopRatedResult.all(),
            genres: [
                GenreResult(id: 18, name: "Drama"),
                GenreResult(id: 80, name: "Crime")
            ]
        )
        .environmentObject(ContentBindigs())
            .previewLayout(.sizeThatFits)
    }
}
