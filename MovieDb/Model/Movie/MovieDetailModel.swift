//
//  MovieDetailModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 27.12.2021.
//

import Foundation

// MARK: - Welcome
struct MovieDetailModel: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: BelongsToCollection?
    var budget: Int?
    var genres: [GenreResult]?
    var homepage: String?
    var id: Int?
    var imdb_id, original_language, original_title, overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [ProductionCompany]?
    var production_countries: [ProductionCountry]?
    var release_date: String?
    var revenue, runtime: Int?
    var spoken_languages: [SpokenLanguage]?
    var status, tagline, title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    
    static func all() -> MovieDetailModel {
        return MovieDetailModel(adult: false,
                                backdrop_path: "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                belongs_to_collection: BelongsToCollection(id: 531241, name: "Spider-Man (Avengers) Collection", poster_path: "/nogV4th2P5QWYvQIMiWHj4CFLU9.jpg", backdrop_path: "/AvnqpRwlEaYNVL6wzC4RN94EdSd.jpg"),
                                budget: 200000000,
                                genres: [GenreResult(id: 28, name: "Action"), GenreResult(id: 12, name: "Adventure"), GenreResult(id: 878, name: "Science Fiction")],
                                homepage: "https://www.spidermannowayhome.movie",
                                id: 634649,
                                imdb_id: "tt10872600",
                                original_language: "en",
                                original_title: "Spider-Man: No Way Home",
                                overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                                popularity: 14136.69,
                                poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                                production_companies: [ProductionCompany(id: 420, logo_path: "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png", name: "Marvel Studios", origin_country: "US"),
                                                       ProductionCompany(id: 84041, logo_path: "/nw4kyc29QRpNtFbdsBHkRSFavvt.png", name: "Pascal Pictures", origin_country: "US"),
                                                       ProductionCompany(id: 5, logo_path: "/71BqEFAF4V3qjjMPCpLuyJFB9A.png", name: "Columbia Pictures", origin_country: "US")],
                                production_countries: [ProductionCountry(iso_3166_1: "US", name: "United States of America")],
                                release_date: "2021-12-15",
                                revenue: 1054431855,
                                runtime: 148,
                                spoken_languages: [SpokenLanguage(english_name: "English", iso_639_1: "en", name: "English"), SpokenLanguage(english_name: "Tagalog", iso_639_1: "tl", name: "English")],
                                status: "Released",
                                tagline: "The Multiverse unleashed.",
                                title: "Spider-Man: No Way Home",
                                video: false,
                                vote_average: 8.5,
                                vote_count: 2671)
    }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int?
    let name, poster_path, backdrop_path: String?
}
