//
//  Untitled.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2026.
//

import Foundation

struct MovieDetailCenterViewModel {
    private let content: MovieDetailModel
    
    init(content: MovieDetailModel) {
        self.content = content
    }
    
    var movieId: Int? {
        return content.id
    }
    
    var rating: String {
        return String(format: "%.1f", content.vote_average ?? 0.0)
    }
    
    var title: String {
        return content.title ?? "-"
    }
    
    var genreText: String {
        guard let genres = content.genres else { return "" }
        return genres.map { $0.name ?? "" }.joined(separator: ", ")
    }
    
    var runtimeText: String {
        return "\(content.runtime ?? 0) min"
    }
    
    var releaseDateText: String {
        // Assuming Converter.convertDate logic is simple date formatting.
        // If it's more complex, we might need to see the Converter implementation.
        let input = content.release_date ?? "-"
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: input) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd.MM.yyyy"
            return outputFormatter.string(from: date)
        } else {
            return "-"
        }
    }
}
