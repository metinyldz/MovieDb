//
//  MovieHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 7.05.2022.
//

import SwiftUI

struct MovieHeaderView: View {
    
    @State private var isActive = false
    @State var pageIndex = 0
    
    var movieTopRatedResult: [MovieTopRatedResult]
    @State var movie: MovieTopRatedResult!
    @EnvironmentObject var contentBindigs: ContentBindigs
    
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
                PagingView(config: .init(margin: 20, spacing: -40), page: $pageIndex) {
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
                .onAppear(perform: {
                    contentBindigs.moviePageIndex = pageIndex
                })
                .onChange(of: pageIndex) { newValue in
                    contentBindigs.moviePageIndex = pageIndex
                }
            }
        } //: ZStack
    }
}

struct MovieHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHeaderView(movieTopRatedResult: MovieTopRatedResult.all())
            .preferredColorScheme(.light)
    }
}
