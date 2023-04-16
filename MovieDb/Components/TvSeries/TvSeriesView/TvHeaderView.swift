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
            } //: VStack
            
            if !tvTopRatedResult.isEmpty {
                PagingView(config: .init(margin: 20, spacing: -40), page: $pageIndex) {
                    Group {
                        ForEach(tvTopRatedResult, id: \.self) { tv in
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tv.poster_path ?? "")")) { image in
                                image
                                    .resizable()
                                    .frame(width: 260, height: 373)
                            } placeholder: {
                                Image("moviePlaceholder")
                                    .resizable()
                                    .frame(width: 260, height: 373)
                            }
                        } //: LOOP
                    } //: GROUP
                    .mask(RoundedRectangle(cornerRadius: 10))
                    .aspectRatio(1.4, contentMode: .fit)
                } //: PAGING
                .frame(height: 373)
                .padding(.vertical, 20)
                .onAppear(perform: {
                    contentBindigs.tvPageIndex = pageIndex
                })
                .onChange(of: pageIndex) { newValue in
                    contentBindigs.tvPageIndex = pageIndex
                }
            }
        } //: ZStack
    }
}

struct TvHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TvHeaderView()
            .preferredColorScheme(.light)
    }
}
