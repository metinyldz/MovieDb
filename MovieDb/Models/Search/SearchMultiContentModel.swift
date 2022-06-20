//
//  SearchMultiContentModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 20.06.2022.
//

import Foundation

// MARK: - Welcome
struct SearchMultiContentModel: Codable, Hashable {
    let page: Int
    let results: [SearchMultiContentResult]
    let total_results, total_pages: Int
}

// MARK: - Result
struct SearchMultiContentResult: Codable, Hashable {
    let poster_path: String?
    let popularity: Double
    let id: Int
    let overview: String?
    let backdrop_path: String?
    let vote_average: Double?
    let media_type: String
    let first_air_date: String?
    let origin_country: [String]?
    let genre_ids: [Int]?
    let original_language: String?
    let vote_count: Int?
    let name, original_name: String?
    let adult: Bool?
    let release_date, original_title, title: String?
    let video: Bool?
    let profile_path: String?
    let known_for: [SearchMultiContentResult]?
    
    static func all() -> SearchMultiContentResult {
        return SearchMultiContentResult(poster_path: "/dl4ftVOH532YmV1I9jOLYwexv2F.jpg",
                                        popularity: 1,
                                        id: 19532,
                                        overview: "The Mrs Bradley Mysteries is a 1998-99 British drama series starring Diana Rigg as Adela Bradley, and Neil Dudgeon as her chauffeur George Moody. The series was produced by the BBC for its BBC One channel, based on the character created by detective writer Gladys Mitchell. Five episodes were produced, including a pilot special. Graham Dalby provided the theme music You're the Cream in My Coffee and he appeared with his orchestra in two episodes. Stylish images of the 1920s are featured, including a classic Rolls Royce limousine and art deco fashions and jewellery worn by the title character.\n\nThe series was shown in the United States by PBS broadcaster WGBH as part of its Mystery! anthology strand, and introduced by Diana Rigg. The full series was also aired in Australia in 2011 by the Seven Network's station 7Two.",
                                        backdrop_path: "/lHebXNadF0WDJWTxO4Zud3xM8he.jpg",
                                        vote_average: 0,
                                        media_type: "tv",
                                        first_air_date: "",
                                        origin_country: [],
                                        genre_ids: [18],
                                        original_language: "en",
                                        vote_count: 0,
                                        name: "The Mrs Bradley Mysteries",
                                        original_name: "The Mrs Bradley Mysteries",
                                        adult: nil,
                                        release_date: nil,
                                        original_title: nil,
                                        title: nil,
                                        video: nil,
                                        profile_path: nil,
                                        known_for: nil)
    }
}
