//
//  TvSeriesCardView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct TvSeriesCardView: View {
    let data = (1...9).map { "Item \($0)" }
    var columns: [GridItem] = [
        GridItem(.fixed(153)),
        GridItem(.fixed(153))
    ]
    @State private var isActive = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(data, id: \.self) { item in
                    
                    /*
                     NavigationLink(destination: MovieDetailView(), isActive: $isActive) {
                         PopularCardView()
                             .padding(.vertical, 10)
                     } //: LINK
                     */
                    NavigationLink(destination: TvSeriesDetailView(), isActive: $isActive) {
                        VStack(alignment: .leading) {
                            Image("moviePlaceholder")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 153, height: 219)
                                .clipShape(Rectangle())
                            
                            Text("Game of Thrones")
                                .font(Font.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .minimumScaleFactor(0.7)
                                .lineLimit(nil)
                                .frame(height: 42)
                                .padding([.horizontal, .bottom],10)
                            
                            RatingView()
                                .padding([.horizontal, .bottom],10)
                            
                        } //: VStack
                        .background(Color.white)
                        .cornerRadius(8)
                    .frame(width: 153, height: 310, alignment: .top)
                    }
                    
                    
                } //: FOREACH
            } //: LAZYVGRID
            .padding(.bottom, 10)
        } //: SCROLL
    }
}

struct TvSeriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesCardView()
            .previewLayout(.fixed(width: 375, height: 530))
            .padding()
            .background(Color.gray)
            
    }
}
