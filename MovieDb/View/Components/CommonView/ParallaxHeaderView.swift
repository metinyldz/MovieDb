//
//  ParallaxHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 10.03.2026.
//

import SwiftUI

struct ParallaxHeaderView: View {

    private let posterPath: String
    private let width: CGFloat
    private let height: CGFloat
    private let placeholderImage: String

    init(
        posterPath: String?,
        width: CGFloat,
        height: CGFloat = 400,
        placeholderImage: String = "moviePlaceholder"
    ) {
        self.posterPath = posterPath ?? ""
        self.width = width
        self.height = height
        self.placeholderImage = placeholderImage
    }

    var body: some View {
        GeometryReader { imageGeometry in
            let global = imageGeometry.frame(in: .global)
            let dynamicHeight = global.minY > 0 ? max(height, global.minY + height) : height

            CachedAsyncImage(
                posterPath: "https://image.tmdb.org/t/p/w500\(posterPath)",
                contentMode: .fill
            ) {
                Image(placeholderImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: dynamicHeight)
                    .clipped()
                    .offset(y: global.minY > 0 ? -global.minY : 0)
            }
            .frame(width: width, height: dynamicHeight)
            .clipped()
            .offset(y: global.minY > 0 ? -global.minY : 0)
            .backButton()
        }
        .frame(height: height)
    }
}

#Preview {
    ParallaxHeaderView(posterPath: "", width: 390)
}
