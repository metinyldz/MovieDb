//
//  MovieDescriptionView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct MovieDescriptionView: View {
    
    var rating: Double?
    var movie: MovieTopRatedResult?
    var genres: [GenreResult]?
    
    var body: some View {
        VStack(alignment: .leading) {
            RatingView(rating: "\(rating ?? 0)")
            
            Text(movie?.title ?? "")
                .font(Font.system(size: 28))
                .fontWeight(.bold)
            Text(getGenres(genreIds: movie?.genre_ids ?? [0]))
                .font(Font.system(size: 14))
                .fontWeight(.medium)
        } //: VStack
        .frame(maxWidth: .infinity,
               maxHeight: 111,
               alignment: .leading)
        .padding(.horizontal, 24)
    }
    
    private func getGenres(genreIds: [Int]?) -> String {
        guard let genreIds = genreIds, let genreResult = genres else { return "" }
        var genreIndexs = [GenreResult]()
        
        for genreId in genreIds {
            genreIndexs.append(genreResult.first(where: {$0.id == genreId})!)
        }
        
        return convertGenresToString(genreIndexs)
    }
    
    private func convertGenresToString(_ genres: [GenreResult]) -> String {
        var text = ""
        for genre in genres {
            if genres.last!.id == genre.id {
                text += genre.name ?? "-"
                break
            }
            text += "\(genre.name ?? "-"), "
        }
        return text
    }
}

struct MovieDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescriptionView()
            .previewLayout(.fixed(width: 375, height: 111))
    }
}
