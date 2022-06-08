//
//  MovieModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 21.12.2021.
//

import Foundation

struct Movie: Codable, Hashable {
    var page: Int
    var results: [MovieResult]?
    var total_pages: Int?
    var total_results: Int?
}

struct MovieResult: Codable, Hashable {
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    
    static func all() -> [MovieResult] {
        return [MovieResult(adult: false,
                            backdrop_path: "/VlHt27nCqOuTnuX6bku8QZapzO.jpg",
                            genre_ids: [28,12,878],
                            id: 634649,
                            original_language: "en",
                            original_title: "Spider-Man: No Way Home",
                            overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                            popularity: 21848.81,
                            poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                            release_date: "2021-12-15",
                            title: "Spider-Man: No Way Home",
                            video: false,
                            vote_average: 8.7,
                            vote_count: 1414),
                MovieResult(adult: false,
                            backdrop_path: "/VlHt27nCqOuTnuX6bku8QZapzO.jpg",
                            genre_ids: [28,12,878],
                            id: 634649,
                            original_language: "en",
                            original_title: "Spider-Man: No Way Home",
                            overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                            popularity: 21848.81,
                            poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                            release_date: "2021-12-15",
                            title: "Spider-Man: No Way Home",
                            video: false,
                            vote_average: 8.7,
                            vote_count: 1414),
                MovieResult(adult: false,
                            backdrop_path: "/VlHt27nCqOuTnuX6bku8QZapzO.jpg",
                            genre_ids: [28,12,878],
                            id: 634649,
                            original_language: "en",
                            original_title: "Spider-Man: No Way Home",
                            overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                            popularity: 21848.81,
                            poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                            release_date: "2021-12-15",
                            title: "Spider-Man: No Way Home",
                            video: false,
                            vote_average: 8.7,
                            vote_count: 1414),
                MovieResult(adult: false,
                            backdrop_path: "/VlHt27nCqOuTnuX6bku8QZapzO.jpg",
                            genre_ids: [28,12,878],
                            id: 634649,
                            original_language: "en",
                            original_title: "Spider-Man: No Way Home",
                            overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                            popularity: 21848.81,
                            poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                            release_date: "2021-12-15",
                            title: "Spider-Man: No Way Home",
                            video: false,
                            vote_average: 8.7,
                            vote_count: 1414),
                MovieResult(adult: false,
                            backdrop_path: "/VlHt27nCqOuTnuX6bku8QZapzO.jpg",
                            genre_ids: [28,12,878],
                            id: 634649,
                            original_language: "en",
                            original_title: "Spider-Man: No Way Home",
                            overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                            popularity: 21848.81,
                            poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                            release_date: "2021-12-15",
                            title: "Spider-Man: No Way Home",
                            video: false,
                            vote_average: 8.7,
                            vote_count: 1414),
                MovieResult(adult: false,
                            backdrop_path: "/VlHt27nCqOuTnuX6bku8QZapzO.jpg",
                            genre_ids: [28,12,878],
                            id: 634649,
                            original_language: "en",
                            original_title: "Spider-Man: No Way Home",
                            overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                            popularity: 21848.81,
                            poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                            release_date: "2021-12-15",
                            title: "Spider-Man: No Way Home",
                            video: false,
                            vote_average: 8.7,
                            vote_count: 1414)]
    }
}
