//
//  TvDescriptionView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.06.2022.
//

import SwiftUI

struct TvDescriptionView: View {
    
    var rating: Double?
    var tv: TvTopRatedResult?
    var genres: [GenreResult]?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let originalName = tv?.original_name, let genreIds = tv?.genre_ids  {
                RatingView(rating: "\(rating ?? 0)")
                
                Text(originalName)
                    .font(Font.system(size: 28))
                    .fontWeight(.bold)
                Text(getGenres(genreIds: genreIds))
                    .font(Font.system(size: 14))
                    .fontWeight(.medium)
            }
        } //: VStack
        .frame(maxWidth: .infinity,
               maxHeight: 111,
               alignment: .leading)
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

struct TvDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        TvDescriptionView()
            .previewLayout(.fixed(width: 375, height: 111))
    }
}
