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
                TabView(selection: $pageIndex) {
                    ForEach(Array(movieTopRatedResult.enumerated()), id: \.element) { index, movie in
                        NavigationLink(destination: MovieLocationView(), isActive: $isActive) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Image("moviePlaceholder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .isDetailLink(false)
                        .buttonStyle(.plain)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 40)
                        .tag(index)
                    } //: LOOP
                } //: TabView
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .frame(height: 373)
                .padding(.vertical, 20)
                .onAppear {
                    contentBindigs.moviePageIndex = pageIndex
                }
                .onChange(of: pageIndex) { newValue in
                    contentBindigs.moviePageIndex = newValue
                }
            }
        } //: ZStack
    }
}

struct MovieHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHeaderView(movieTopRatedResult: MovieTopRatedResult.all())
            .environmentObject(ContentBindigs())
            .preferredColorScheme(.light)
    }
}
