//
//  ImageLoader.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2026.
//

import SwiftUI
import Combine
import UIKit

final class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
}

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var urlString: String?
    private var task: URLSessionDataTask?

    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }

    deinit {
        task?.cancel()
    }

    private func loadImage() {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        let cacheKey = NSString(string: urlString)
        if let cached = ImageCache.shared.object(forKey: cacheKey) {
            self.image = cached
            return
        }

        // Fetch in background
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let uiImage = UIImage(data: data) else { return }
            // Optional: could downsample here for large images
            ImageCache.shared.setObject(uiImage, forKey: cacheKey)
            DispatchQueue.main.async {
                self.image = uiImage
            }
        }
        task?.resume()
    }
}
