//
//  TvDescriptionView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.06.2022.
//

import SwiftUI

struct TvDescriptionView: View {
    
    @Binding var rating: Double?
    @Binding var tv: TvTopRatedResult
    @Binding var tvGenres: [Int]?
    
    var body: some View {
        VStack(alignment: .leading) {
            RatingView(rating: "\(rating ?? 0)")
            
            Text(tv.original_name ?? "")
                .font(Font.system(size: 28))
                .fontWeight(.bold)
            Text(getGenres(genreIds: tv.genre_ids))
                .font(Font.system(size: 14))
                .fontWeight(.medium)
        } //: VStack
        .frame(maxWidth: .infinity,
               maxHeight: 111,
               alignment: .leading)
    }
    
    private func getGenres(genreIds: [Int]?) -> String {
        guard let genreIds = genreIds else { return "" }
        
        var genreIndexs = [GenreResult]()
        
        for genreId in genreIds {
            genreIndexs.append(GenreModel.tvInstance.first(where: {$0.id == genreId})!)
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
        TvDescriptionView(rating: .constant(0),
                          tv: .constant(TvTopRatedResult.all().first!),
                          tvGenres: .constant([0]))
            .previewLayout(.fixed(width: 375, height: 111))
    }
}
