//
//  CachedAsyncImage.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2026.
//


import SwiftUI

struct CachedAsyncImage<Placeholder: View>: View {
    @StateObject private var loader = ImageLoader()
    private let url: String?
    private let contentMode: ContentMode
    private let placeholder: Placeholder
    
    init(
        url: String?,
        contentMode: ContentMode = .fit,
        @ViewBuilder placeholder: () -> Placeholder
    ) {
        self.url = url
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
            if let urlString = url, let validUrl = URL(string: urlString) {
                loader.load(url: validUrl)
            }
        }
        .onChange(of: url) { newUrl in
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
    CachedAsyncImage(url: "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg") {
        Image("moviePlaceholder")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}
