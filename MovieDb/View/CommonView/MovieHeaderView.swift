//
//  MovieHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 7.05.2022.
//

import SwiftUI

struct MovieHeaderView: View {
    
    @Binding var items: [MovieTopRatedResult]
    @State private var isActive = false
    @State static var index = 0
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(height: 120.0)
                    .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(Color("VibrantBlue"))
                
                Spacer()
            } //: VStack
            
            PagingView(config: .init(margin: 20, spacing: -40)) {
                Group {
                    ForEach($items, id: \.id) { item in
                        NavigationLink(destination: MovieLocationView(), isActive: $isActive) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(item.poster_path)")) { image in
                                image
                                    .resizable()
                                    .frame(width: 260, height: 373)
                            } placeholder: {
                                Image("moviePlaceholder")
                                    .resizable()
                                    .frame(width: 260, height: 373)
                            } //: ASYNC IMAGE
                        } //: LINK
                        .isDetailLink(false)
                        .buttonStyle(.plain)
                    } //: FOR
                } //: GROUP
                .mask(RoundedRectangle(cornerRadius: 10))
                .aspectRatio(1.4, contentMode: .fit)
                
            } //: PAGING
            .frame(height: 373)
            .padding(.vertical, 20)
            
        } //: ZStack
    }
}

struct MovieHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHeaderView(items: .constant(MovieTopRatedResult.all()))
            .previewDisplayName("iPhone 12 Mini")
            .preferredColorScheme(.light)
    }
}
