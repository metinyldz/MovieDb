//
//  TvHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.06.2022.
//

import SwiftUI

struct TvHeaderView: View {
    
    @State private var isActive = false
    @State var pageIndex = 0
    
    var tvTopRatedResult: [TvTopRatedResult] = []
    
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(height: 120.0)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color("VibrantBlue"))
                
                Spacer()
            }
            
            if !tvTopRatedResult.isEmpty {
                TabView(selection: $pageIndex) {
                    ForEach(Array(tvTopRatedResult.enumerated()), id: \.element) { index, tv in
                        CachedAsyncImage(url: "https://image.tmdb.org/t/p/w500\(tv.poster_path ?? "")") {
                            Image("moviePlaceholder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: 260, height: 373)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 40)
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .frame(height: 373)
                .padding(.vertical, 20)
                .onAppear {
                    contentBindigs.tvPageIndex = pageIndex
                }
                .onChange(of: pageIndex) { newValue in
                    contentBindigs.tvPageIndex = newValue
                }
            }
        }
    }
}

#Preview {
    TvHeaderView()
}
