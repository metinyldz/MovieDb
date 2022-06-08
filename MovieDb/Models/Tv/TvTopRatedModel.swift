//
//  TvSeriesModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 26.12.2021.
//

import Foundation

struct TvTopRatedModel: Codable {
    var page: Int
    var results: [TvTopRatedResult]?
}

struct TvTopRatedResult: Codable {
    var backdrop_path: String?
    var first_air_date: String?
    var genre_ids: [Int]?
    var id: Int?
    var name: String?
    var origin_country: [String]?
    var original_language: String?
    var original_name: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var vote_average: Double?
    var vote_count: Int?
    
    static func all() -> [TvTopRatedResult] {
        return [TvTopRatedResult(backdrop_path: "/7q448EVOnuE3gVAx24krzO7SNXM.jpg",
                                 first_air_date: "2021-09-03",
                                 genre_ids: [10764],
                                 id: 130392,
                                 name: "The D'Amelio Show",
                                 origin_country: ["US"],
                                 original_language: "en",
                                 original_name: "The D'Amelio Show",
                                 overview: "From relative obscurity and a seemingly normal life, to overnight success and thrust into the Hollywood limelight overnight, the D’Amelios are faced with new challenges and opportunities they could not have imagined.",
                                 popularity: 19.641,
                                 poster_path: "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg",
                                 vote_average: 9.4,
                                 vote_count: 2577),
                TvTopRatedResult(backdrop_path: "/7q448EVOnuE3gVAx24krzO7SNXM.jpg",
                                 first_air_date: "2021-09-03",
                                 genre_ids: [10764],
                                 id: 130392,
                                 name: "The D'Amelio Show",
                                 origin_country: ["US"],
                                 original_language: "en",
                                 original_name: "The D'Amelio Show",
                                 overview: "From relative obscurity and a seemingly normal life, to overnight success and thrust into the Hollywood limelight overnight, the D’Amelios are faced with new challenges and opportunities they could not have imagined.",
                                 popularity: 19.641,
                                 poster_path: "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg",
                                 vote_average: 9.4,
                                 vote_count: 2577),
                TvTopRatedResult(backdrop_path: "/7q448EVOnuE3gVAx24krzO7SNXM.jpg",
                                 first_air_date: "2021-09-03",
                                 genre_ids: [10764],
                                 id: 130392,
                                 name: "The D'Amelio Show",
                                 origin_country: ["US"],
                                 original_language: "en",
                                 original_name: "The D'Amelio Show",
                                 overview: "From relative obscurity and a seemingly normal life, to overnight success and thrust into the Hollywood limelight overnight, the D’Amelios are faced with new challenges and opportunities they could not have imagined.",
                                 popularity: 19.641,
                                 poster_path: "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg",
                                 vote_average: 9.4,
                                 vote_count: 2577),
                TvTopRatedResult(backdrop_path: "/7q448EVOnuE3gVAx24krzO7SNXM.jpg",
                                 first_air_date: "2021-09-03",
                                 genre_ids: [10764],
                                 id: 130392,
                                 name: "The D'Amelio Show",
                                 origin_country: ["US"],
                                 original_language: "en",
                                 original_name: "The D'Amelio Show",
                                 overview: "From relative obscurity and a seemingly normal life, to overnight success and thrust into the Hollywood limelight overnight, the D’Amelios are faced with new challenges and opportunities they could not have imagined.",
                                 popularity: 19.641,
                                 poster_path: "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg",
                                 vote_average: 9.4,
                                 vote_count: 2577)]
    }
}
