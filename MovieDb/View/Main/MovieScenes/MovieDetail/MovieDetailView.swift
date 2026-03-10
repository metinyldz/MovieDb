//
//  MovieDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct MovieDetailView: View {
    var content: MovieDetailModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack {
                    if let _ = content.genres {
                        // MARK: - HEADER -
                        ParallaxHeaderView(
                            posterPath: content.poster_path,
                            width: geometry.size.width
                        )
                        
                        // MARK: - CENTER -
                        MovieDetailCenterView(content: content)
                            .padding(.top, -20)
                        
                        // MARK: - FOOTER -
                        MovieDetailFooterView(content: content)
                            .padding(.horizontal, 24)
                    }
                }
            }
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MovieDetailView(content: MovieDetailModel.all())
}
