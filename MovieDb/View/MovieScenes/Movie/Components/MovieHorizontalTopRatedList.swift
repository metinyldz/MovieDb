//
//  MovieHorizontalTopRatedList.swift
//  MovieDb
//
//  Created by Metin Yıldız on 25.01.2026.
//

import SwiftUI

struct MovieHorizontalTopRatedList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .zero) { // TODO: Add api and real response
                getImageInformationView()
                getImageInformationView()
                getImageInformationView()
                getImageInformationView()
                getImageInformationView()
            }
            .padding(.horizontal, 24)
        }
    }
    
    func getImageInformationView() -> some View {
        VStack(spacing: 5) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")) { image in
                image
                    .resizable()
                    .frame(width: 260, height: 373)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                Image("moviePlaceholder")
                    .resizable()
                    .frame(width: 260, height: 373)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            SmallRatingView(rating: "8.78")
            
            Text("The Shawshank Redemption Redemption Redemption")
                .frame(maxWidth: 300, alignment: .leading)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
            
            Text("Drama, Crime")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)
                .fontWeight(.medium)
        }
    }
}

struct MovieHorizontalTopRatedList_Previews: PreviewProvider {
    static var previews: some View {
        MovieHorizontalTopRatedList()
            .previewLayout(.sizeThatFits)
    }
}
