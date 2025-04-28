//
//  MovieDetailCenterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 10.05.2022.
//

import SwiftUI

struct MovieDetailCenterView: View {
    
    var content: MovieDetailModel
    
    var body: some View {
        VStack(alignment: .leading) {
            SmallRatingView(rating: String(format: "%.1f", content.vote_average ?? 0.0))
            
            Text(content.title ?? "-")
                .font(Font.system(size: 28))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(Converter.genreText(genres: content.genres!))
                .font(Font.system(size: 15))
                .fontWeight(.medium)
                .foregroundColor(.black)

            HStack {
                Image("time")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                
                Text("\(content.runtime ?? 0) min")
                    .font(Font.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .opacity(0.6)
                
                Divider()
                    .padding(.horizontal, 10)
                    .frame(height: 12)
                
                Image("calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                
                Text(Converter.convertDate(input: content.release_date ?? "-", dateType: .date))
                    .font(Font.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .opacity(0.6)
                
                Divider()
                    .padding(.horizontal, 10)
                    .frame(height: 12)
            } //: HStack
            
            Divider()
                .padding(.vertical, 20)
            
        } //: VStack
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        
    }
}

struct MovieDetailCenterView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailCenterView(content: MovieDetailModel.all())
            .previewLayout(.sizeThatFits)
    }
}
