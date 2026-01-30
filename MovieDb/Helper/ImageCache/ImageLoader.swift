//
//  ImageLoader.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2026.
//

import SwiftUI
import Combine

// Basit bir Cache sarmalayıcı (Singleton)
class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {
        // RAM güvenliği için limitler (Örn: 100 resim veya yaklaşık 50MB)
        ImageCache.shared.countLimit = 100
        ImageCache.shared.totalCostLimit = 1024 * 1024 * 50
    }
}

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var task: URLSessionDataTask?
    
    func load(url: URL) {
        // 1. Önce Cache kontrolü
        let cacheKey = NSString(string: url.absoluteString)
        if let cached = ImageCache.shared.object(forKey: cacheKey) {
            self.image = cached
            return
        }
        
        // Önceki task varsa iptal et (Hızlı scroll sırasında gereksiz yüklemeyi önler)
        task?.cancel()
        
        task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else { return }
            
            // 2. AĞIR İŞLEM: Decoding ve Resize işlemini Background Thread'de yap
            DispatchQueue.global(qos: .userInitiated).async {
                // Resmi decode edilmiş ve (gerekirse) küçültülmüş olarak hazırla
                guard let decodedImage = self.decodeImage(from: data) else { return }
                
                // Cache'e at
                ImageCache.shared.setObject(decodedImage, forKey: cacheKey)
                
                // UI Güncellemesini Main Thread'e gönder
                DispatchQueue.main.async {
                    self.image = decodedImage
                }
            }
        }
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
    
    // Resmi zorla decode eden yardımcı fonksiyon
    private func decodeImage(from data: Data) -> UIImage? {
        guard let image = UIImage(data: data) else { return nil }
        
        // Eğer resim zaten hazırsa veya çok küçükse direkt dön
        // Ancak performansı garantiye almak için redraw yapmak en iyisidir:
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        image.draw(at: .zero)
        let decodedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return decodedImage
    }
}
