//
//  TvSeriesSingleCardView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 15.06.2022.
//

import SwiftUI

struct TvSeriesSingleCardView: View {
    
    var tvResult: TvSeriesResult
//    var tvCast: TvSerieCastModel
    @State var isFavorite: Bool = false
    
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tvResult.poster_path ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 153, height: 219)
                    .clipShape(Rectangle())
            } placeholder: {
                Image("moviePlaceholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 153, height: 219)
                    .clipShape(Rectangle())
            }
            
            HStack {
                Text(tvResult.original_name ?? "-")
                    .font(Font.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.7)
                    .lineLimit(nil)
                    .frame(height: 42)
                
                Spacer()
                
                Image(getFavoriteItem(tvResult) ? "heartSelected" : "heart")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFit()
                    .onTapGesture {
                        !getFavoriteItem(tvResult) ? addContentToUserDefaults() : removeContentToUserDefaults()
                    }
            } //: HSTack
            .padding([.horizontal, .bottom],10)
            
            SmallRatingView(rating: "\(tvResult.vote_average ?? 0)")
                .padding([.horizontal, .bottom],10)
            
        } //: VStack
        .background(Color.white)
        .cornerRadius(8)
        .frame(width: 153, height: 310, alignment: .top)
    }
    
    private func getFavoriteItem(_ tvResult: TvSeriesResult) -> Bool {
        var temp = false
        
        return UserDefaults.standard.favoriteModel.contains { item in
            temp = (item.contentId == tvResult.id ?? -1)
            return temp
        }
    }
    
    private func addContentToUserDefaults() {
        let date = Converter.convertDate(input: tvResult.first_air_date ?? "-", dateType: .date)
        let model = FavoriteModel(contentId: tvResult.id ?? -1,
                                  contentUrl: tvResult.poster_path ?? "-",
                                  contentTitle: tvResult.original_name ?? "-",
                                  contentDate: date)
        UserDefaults.standard.favoriteModel.append(model)
        contentBindigs.favoriteContents.append(model)
    }
    
    private func removeContentToUserDefaults() {
        UserDefaults.standard.favoriteModel.removeAll { item in
            return item.contentId == tvResult.id
        }
        contentBindigs.favoriteContents.removeAll { item in
            return item.contentId == tvResult.id
        }
    }
}

struct TvSeriesSingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesSingleCardView(tvResult: TvSeriesResult.all().first!)
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
    }
}
