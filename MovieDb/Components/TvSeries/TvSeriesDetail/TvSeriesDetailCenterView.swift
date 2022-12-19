//
//  TvSeriesDetailCenterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 17.05.2022.
//

import SwiftUI

struct TvSeriesDetailCenterView: View {
    
    var content: TvSerieDetailModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if let genres = content.genres {
                RatingView(rating: "\(content.vote_average ?? -1)")
                
                Text(content.original_name ?? "-")
                    .font(Font.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(Converter.genreText(genres: genres))
                    .font(Font.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(.black)

                HStack {
                    Image("time")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                    
                    Text("\(content.episode_run_time?.first ?? 0) min")
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
                    
                    Text("TV Series (\(Converter.convertDate(input: content.first_air_date ?? "-", dateType: .year)) - \(Converter.convertDate(input: content.last_air_date ?? "-", dateType: .year)))")
                        .font(Font.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .opacity(0.6)
                    
                } //: HStack
                
                Divider()
                    .padding(.vertical, 20)
            }
        } //: VStack
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
    }
}

struct TvSeriesDetailCenterView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesDetailCenterView(content: TvSerieDetailModel.all())
            .previewLayout(.sizeThatFits)
    }
}
