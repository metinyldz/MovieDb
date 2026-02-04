//
//  MovieDetailHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2026.
//

import SwiftUI

struct MovieDetailHeaderView: View {
    
    private var posterPath: String = ""
    
    init(posterPath: String?) {
        self.posterPath = posterPath ?? ""
    }
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { proxy in
                    let global = proxy.frame(in: .global)
                    // Header
                    CachedAsyncImage(url: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                        Image("moviePlaceholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .offset(y: global.minY > 0 ? -global.minY : 0)
                    .frame(height: global.minY > 0 ? (400) + global.minY :  400)
                    .clipped()
                }
            }
        }
        .backButton()
    }
}

#Preview {
    MovieDetailHeaderView(posterPath: "")
}
