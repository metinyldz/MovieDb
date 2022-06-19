//
//  SearchContentModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 19.06.2022.
//

import Foundation

struct SearchContentModel: Codable, Hashable {
    var pages: Int?
    var results: [SearchContentResultDetail]?
    var total_results: Int?
    var total_pages: Int?
    
    static func all() -> SearchContentModel {
        return SearchContentModel(pages: 1,
                                  results: [SearchContentResultDetail(poster_path: "/dl4ftVOH532YmV1I9jOLYwexv2F.jpg",
                                                                      popularity: 1,
                                                                      id: 19532,
                                                                      overview: "The Mrs Bradley Mysteries is a 1998-99 British drama series starring Diana Rigg as Adela Bradley, and Neil Dudgeon as her chauffeur George Moody. The series was produced by the BBC for its BBC One channel, based on the character created by detective writer Gladys Mitchell. Five episodes were produced, including a pilot special. Graham Dalby provided the theme music You're the Cream in My Coffee and he appeared with his orchestra in two episodes. Stylish images of the 1920s are featured, including a classic Rolls Royce limousine and art deco fashions and jewellery worn by the title character.\n\nThe series was shown in the United States by PBS broadcaster WGBH as part of its Mystery! anthology strand, and introduced by Diana Rigg. The full series was also aired in Australia in 2011 by the Seven Network's station 7Two.",
                                                                      backdrop_path: "/lHebXNadF0WDJWTxO4Zud3xM8he.jpg",
                                                                      vote_average: 0,
                                                                      media_type: "tv",
                                                                      first_air_date: "",
                                                                      origin_country: [""],
                                                                      genre_ids: [18],
                                                                      original_language: "en",
                                                                      vote_count: 0,
                                                                      name: "The Mrs Bradley Mysteries",
                                                                      original_name: "The Mrs Bradley Mysteries")],
                                  total_results: 382,
                                  total_pages: 20)
    }
}

struct SearchContentResultDetail: Codable, Hashable {
    var poster_path: String?
    var popularity: Double?
    var id: Int?
    var overview: String?
    var backdrop_path: String?
    var vote_average: Double?
    var media_type: String?
    var first_air_date: String?
    var origin_country: [String]?
    var genre_ids: [Int]?
    var original_language: String?
    var vote_count: Int?
    var name: String?
    var original_name: String?
}
