//
//  MovieDescriptionView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct MovieDescriptionView: View {
    
    @Binding var item: MovieDescriptionModel
    
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

struct MovieDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescriptionView(item: .constant(MovieDescriptionModel(rating: "8.8", movieTitle: "adasd", movieGenre: "Krime, asdas")))
            .previewLayout(.fixed(width: 375, height: 111))
    }
}
