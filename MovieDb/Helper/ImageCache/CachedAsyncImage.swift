//
//  CachedAsyncImage.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2026.
//


import SwiftUI

struct CachedAsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let imageContentMode: ContentMode

    init(url: String?, imageContentMode: ContentMode = .fill, @ViewBuilder placeholder: () -> Placeholder) {
        _loader = StateObject(wrappedValue: ImageLoader(urlString: url))
        self.placeholder = placeholder()
        self.imageContentMode = imageContentMode
    }

    var body: some View {
        Group {
            if let uiImage = loader.image {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: imageContentMode)
            } else {
                placeholder
            }
        }
    }
}
