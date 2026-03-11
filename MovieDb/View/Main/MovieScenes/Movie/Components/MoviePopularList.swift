//
//  MoviePopularList.swift
//  MovieDb
//
//  Created by Metin Yıldız on 25.01.2026.
//

import SwiftUI

struct MoviePopularList: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    let movies: [MovieResult]
    let genres: [GenreResult]

    var body: some View {
        VStack(spacing: 30) {
            Text("Popular")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(1)
            
            VStack(spacing: 30) {
                ForEach(movies, id: \.self) { movie in
                    smallItemCardView(for: movie)
                        .onTapGesture {
                            if let id = movie.id {
                                navigationManager.navigate(to: .movieDetail(id: id))
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func smallItemCardView(for movie: MovieResult) -> some View {
        HStack(spacing: 10) {
            CachedAsyncImage(posterPath: movie.poster_path, contentMode: .fill) {
                Image("moviePlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 70)
            
            VStack(spacing: 5) {
                HStack(spacing: .zero) {
                    Text(movie.title ?? "-")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                    
                    Image(systemName: "heart")
                        .frame(alignment: .trailing)
                }
                
                Text(genresText(for: movie.genre_ids))
                    .font(.callout)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: .zero) {
                    Image(systemName: "calendar")
                        .foregroundStyle(Color("VibrantBlue"))
                                        
                    Text(releaseDateText(from: movie.release_date))
                        .font(.caption)
                        .fontWeight(.light)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Text(movie.vote_average?.format(f: ".2") ?? "-")
                        .font(.caption)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 8)
                        .background(Color("VibrantBlue"))
                        .clipShape(.capsule)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
    }

    private func releaseDateText(from releaseDate: String?) -> String {
        guard let releaseDate else { return "-" }
        return Converter.convertDate(input: releaseDate, dateType: .date)
    }

    private func genresText(for genreIds: [Int]?) -> String {
        guard let genreIds else { return "" }
        let names = genreIds.compactMap { genreId in
            genres.first(where: { $0.id == genreId })?.name
        }
        return names.joined(separator: ", ")
    }
}

struct MoviePopularList_Previews: PreviewProvider {
    static var previews: some View {
        MoviePopularList(
            movies: MovieResult.all(),
            genres: [
                GenreResult(id: 28, name: "Action"),
                GenreResult(id: 12, name: "Adventure"),
                GenreResult(id: 878, name: "Science Fiction")
            ]
        )
            .previewLayout(.sizeThatFits)
    }
}
