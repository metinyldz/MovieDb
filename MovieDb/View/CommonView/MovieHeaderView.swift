//
//  MovieHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 7.05.2022.
//

import SwiftUI

struct MovieHeaderView: View {
    
    @State private var isActive = false
    var movieTopRatedResult: [MovieTopRatedResult] = []
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(height: 120.0)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color("VibrantBlue"))
                
                Spacer()
            } //: VStack
            
            if !movieTopRatedResult.isEmpty {
                PagingView(config: .init(margin: 20, spacing: -40)) {
                    Group {
                        ForEach(movieTopRatedResult, id: \.self) { movie in
                            NavigationLink(destination: MovieLocationView(), isActive: $isActive) {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                                    image
                                        .resizable()
                                        .frame(width: 260, height: 373)
                                } placeholder: {
                                    Image("moviePlaceholder")
                                        .resizable()
                                        .frame(width: 260, height: 373)
                                }
                            }.isDetailLink(false).buttonStyle(.plain)
                        } //: LOOP
                    } //: GROUP
                    .mask(RoundedRectangle(cornerRadius: 10))
                    .aspectRatio(1.4, contentMode: .fit)
                    
                } //: PAGING
                .frame(height: 373)
                .padding(.vertical, 20)
            }

        } //: ZStack
    }
}

/*
 AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path!)")) { image in
     image
         .resizable()
         .scaledToFill()
         .frame(width: 260.0, height: 373.0)
         .cornerRadius(8.0)
     
 } placeholder: {
     Image("MoviePlaceholder")
         .resizable()
         .scaledToFill()
         .frame(width: 260.0, height: 373.0)
 }
 */

struct MovieHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHeaderView()
            .previewDisplayName("iPhone 12 Mini")
            .preferredColorScheme(.light)
    }
}
