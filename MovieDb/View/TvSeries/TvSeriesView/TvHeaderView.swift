//
//  TvHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.06.2022.
//

import SwiftUI

struct TvHeaderView: View {
    
    @State private var isActive = false
    var tvTopRatedResult: [TvTopRatedResult] = []
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(height: 120.0)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color("VibrantBlue"))
                
                Spacer()
            } //: VStack
            
            if !tvTopRatedResult.isEmpty {
                PagingView(config: .init(margin: 20, spacing: -40)) {
                    Group {
                        ForEach(tvTopRatedResult, id: \.self) { tv in
                            NavigationLink(destination: MovieLocationView(), isActive: $isActive) {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tv.poster_path ?? "")")) { image in
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

struct TvHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TvHeaderView()
            .previewDisplayName("iPhone 12 Mini")
            .preferredColorScheme(.light)
    }
}
