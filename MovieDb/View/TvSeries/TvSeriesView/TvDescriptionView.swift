//
//  TvDescriptionView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.06.2022.
//

import SwiftUI

struct TvDescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            RatingView()
            
            Text("Joker")
                .font(Font.system(size: 28))
                .fontWeight(.bold)
            Text("Crime, Drama, Thriller ")
                .font(Font.system(size: 14))
                .fontWeight(.medium)
        } //: VStack
        .frame(maxWidth: .infinity,
               maxHeight: 111,
               alignment: .leading)
    }
}

struct TvDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        TvDescriptionView()
            .previewLayout(.fixed(width: 375, height: 111))
    }
}
