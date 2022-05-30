//
//  TvSeriesModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 26.12.2021.
//

import Foundation

struct TvSeriesModel: Codable {
    var page: Int
    var results: [TvSeriesResult]?
}

struct TvSeriesResult: Codable {
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
    
    static func all() -> [TvSeriesResult] {
        return [TvSeriesResult(backdrop_path: "/9QNv2Al3GfCND8BwuLmu2GwVht7.jpg",
                               first_air_date: "2021-11-24",
                               genre_ids: [10759, 18],
                               id: 88329,
                               name: "Hawkeye",
                               origin_country: ["US"],
                               original_language: "en",
                               original_name: "Hawkeye",
                               overview: "Former Avenger Clint Barton has a seemingly simple mission: get back to his family for Christmas. Possible? Maybe with the help of Kate Bishop, a 22-year-old archer with dreams of becoming a superhero. The two are forced to work together when a presence from Barton’s past threatens to derail far more than the festive spirit.",
                               popularity: 2951.626,
                               poster_path: "/pqzjCxPVc9TkVgGRWeAoMmyqkZV.jpg",
                               vote_average: 8.5,
                               vote_count: 1115),
                TvSeriesResult(backdrop_path: "/9QNv2Al3GfCND8BwuLmu2GwVht7.jpg",
                               first_air_date: "2021-11-24",
                               genre_ids: [10759, 18],
                               id: 88329,
                               name: "Hawkeye",
                               origin_country: ["US"],
                               original_language: "en",
                               original_name: "Hawkeye",
                               overview: "Former Avenger Clint Barton has a seemingly simple mission: get back to his family for Christmas. Possible? Maybe with the help of Kate Bishop, a 22-year-old archer with dreams of becoming a superhero. The two are forced to work together when a presence from Barton’s past threatens to derail far more than the festive spirit.",
                               popularity: 2951.626,
                               poster_path: "/pqzjCxPVc9TkVgGRWeAoMmyqkZV.jpg",
                               vote_average: 8.5,
                               vote_count: 1115),
                TvSeriesResult(backdrop_path: "/9QNv2Al3GfCND8BwuLmu2GwVht7.jpg",
                               first_air_date: "2021-11-24",
                               genre_ids: [10759, 18],
                               id: 88329,
                               name: "Hawkeye",
                               origin_country: ["US"],
                               original_language: "en",
                               original_name: "Hawkeye",
                               overview: "Former Avenger Clint Barton has a seemingly simple mission: get back to his family for Christmas. Possible? Maybe with the help of Kate Bishop, a 22-year-old archer with dreams of becoming a superhero. The two are forced to work together when a presence from Barton’s past threatens to derail far more than the festive spirit.",
                               popularity: 2951.626,
                               poster_path: "/pqzjCxPVc9TkVgGRWeAoMmyqkZV.jpg",
                               vote_average: 8.5,
                               vote_count: 1115),
                TvSeriesResult(backdrop_path: "/9QNv2Al3GfCND8BwuLmu2GwVht7.jpg",
                               first_air_date: "2021-11-24",
                               genre_ids: [10759, 18],
                               id: 88329,
                               name: "Hawkeye",
                               origin_country: ["US"],
                               original_language: "en",
                               original_name: "Hawkeye",
                               overview: "Former Avenger Clint Barton has a seemingly simple mission: get back to his family for Christmas. Possible? Maybe with the help of Kate Bishop, a 22-year-old archer with dreams of becoming a superhero. The two are forced to work together when a presence from Barton’s past threatens to derail far more than the festive spirit.",
                               popularity: 2951.626,
                               poster_path: "/pqzjCxPVc9TkVgGRWeAoMmyqkZV.jpg",
                               vote_average: 8.5,
                               vote_count: 1115),
                TvSeriesResult(backdrop_path: "/9QNv2Al3GfCND8BwuLmu2GwVht7.jpg",
                               first_air_date: "2021-11-24",
                               genre_ids: [10759, 18],
                               id: 88329,
                               name: "Hawkeye",
                               origin_country: ["US"],
                               original_language: "en",
                               original_name: "Hawkeye",
                               overview: "Former Avenger Clint Barton has a seemingly simple mission: get back to his family for Christmas. Possible? Maybe with the help of Kate Bishop, a 22-year-old archer with dreams of becoming a superhero. The two are forced to work together when a presence from Barton’s past threatens to derail far more than the festive spirit.",
                               popularity: 2951.626,
                               poster_path: "/pqzjCxPVc9TkVgGRWeAoMmyqkZV.jpg",
                               vote_average: 8.5,
                               vote_count: 1115)]
    }
}
