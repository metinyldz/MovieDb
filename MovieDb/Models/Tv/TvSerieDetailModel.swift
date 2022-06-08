//
//  TvSerieDetailModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 27.12.2021.
//

import Foundation

// MARK: - Welcome
struct TvSerieDetailModel: Codable {
    var backdrop_path: String?
    var created_by: [CreatedBy]?
    var episode_run_time: [Int]?
    var first_air_date: String?
    var genres: [GenreResult]?
    var homepage: String?
    var id: Int?
    var in_production: Bool?
    var languages: [String]?
    var last_air_date: String?
    var last_episode_to_air: LastEpisodeToAir?
    var name: String?
    var networks: [Network]?
    var number_of_episodes, number_of_seasons: Int?
    var origin_country: [String]?
    var original_language, original_name, overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [Network]?
    var production_countries: [ProductionCountry]?
    var seasons: [Season]?
    var spoken_languages: [SpokenLanguage]?
    var status, tagline, type: String?
    var vote_average: Double?
    var vote_count: Int?
    
    static func all() -> TvSerieDetailModel {
        let model = TvSerieDetailModel(backdrop_path: "/suopoADq0k8YZr4dQXcU6pToj6s.jpg",
                                       created_by: [CreatedBy(id: 9813, credit_id: "5256c8c219c2956ff604858a", name: "David Benioff", gender: 2, profile_path: "/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg")],
                                       episode_run_time: [60],
                                       first_air_date: "2011-04-17",
                                       genres: [GenreResult(id: 10765, name: "Sci-Fi & Fantasy"), GenreResult(id: 18, name: "Drama"), GenreResult(id: 10759, name: "Action & Adventure")],
                                       homepage: "http://www.hbo.com/game-of-thrones",
                                       id: 1399,
                                       in_production: false,
                                       languages: ["en"],
                                       last_air_date: "2019-05-19",
                                       last_episode_to_air: LastEpisodeToAir(air_date: "2019-05-19",
                                                                             episode_number: 6,
                                                                             id: 1551830,
                                                                             name: "The Iron Throne",
                                                                             overview: "In the aftermath of the devastating attack on King's Landing, Daenerys must face the survivors.", production_code: "806", season_number: 8, still_path: "/3x8tJon5jXFa1ziAM93hPKNyW7i.jpg",
                                                                             vote_average: 4.8,
                                                                             vote_count: 106),
                                       name: "Game of Thrones",
                                       networks: [Network(name: "HBO", id: 49, logo_path: "/tuomPhY2UtuPTqqFnKMVHvSb724.png", origin_country: "US")],
                                       number_of_episodes: 73,
                                       number_of_seasons: 8,
                                       origin_country: ["US"],
                                       original_language: "en",
                                       original_name: "Game of Thrones",
                                       overview: "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
                                       popularity: 369.594,
                                       poster_path: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
                                       production_companies: [Network(name: "Revolution Sun Studios", id: 76043, logo_path: "/9RO2vbQ67otPrBLXCaC8UMp3Qat.png", origin_country: "US")],
                                       production_countries: [ProductionCountry(iso_3166_1: "GB", name: "United Kingdom")],
                                       seasons: [Season(air_date: "2010-12-05", episode_count: 64, id: 3627, name: "Specials", overview: "", poster_path: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg", season_number: 0)],
                                       spoken_languages: [SpokenLanguage(english_name: "English", iso_639_1: "en", name: "English")],
                                       status: "Ended",tagline: "Winter Is Coming",
                                       type: "Scripted",
                                       vote_average: 8.3,
                                       vote_count: 11504)
        return model
    }
}

struct CreatedBy: Codable {
    var id: Int?
    var credit_id, name: String?
    var gender: Int?
    var profile_path: String?
}

struct LastEpisodeToAir: Codable {
    var air_date: String?
    var episode_number, id: Int?
    var name, overview, production_code: String?
    var season_number: Int?
    var still_path: String?
    var vote_average: Double?
    var vote_count: Int?
}

struct Network: Codable {
    var name: String?
    var id: Int?
    var logo_path, origin_country: String?
}

struct Season: Codable {
    var air_date: String?
    var episode_count, id: Int?
    var name, overview, poster_path: String?
    var season_number: Int?
}
