//
//  CachedAsyncImage.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2026.
//


import SwiftUI

struct CachedAsyncImage<Placeholder: View>: View {
    @StateObject private var loader = ImageLoader()
    private let posterPath: String?
    private let contentMode: ContentMode
    private let placeholder: Placeholder
    private let baseURL: String = "https://image.tmdb.org/t/p/w500"
    init(
        posterPath: String?,
        contentMode: ContentMode = .fit,
        @ViewBuilder placeholder: () -> Placeholder
    ) {
        self.posterPath = baseURL + (posterPath ?? "")
        self.contentMode = contentMode
        self.placeholder = placeholder()
    }
    
    var body: some View {
        Group {
            if let uiImage = loader.image {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            } else {
                placeholder
            }
        }
        .onAppear {
            if let urlString = posterPath, let validUrl = URL(string: urlString) {
                loader.load(url: validUrl)
            }
        }
        .onChange(of: posterPath) { newUrl in
            if let urlString = newUrl, let validUrl = URL(string: urlString) {
                loader.load(url: validUrl)
            }
        }
        .onDisappear {
            loader.cancel()
        }
    }
}

#Preview {
    CachedAsyncImage(posterPath: "/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg") {
        Image("moviePlaceholder")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}
