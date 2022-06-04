//
//  MovieTopRated.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 26.12.2021.
//

import Foundation

struct MovieTopRated: Codable {
    var page: Int
    var results: [MovieTopRatedResult]?
    var total_pages: Int?
    var total_results: Int?
}

struct MovieTopRatedResult: Codable, Hashable, Identifiable {
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
    
    static func all() -> [MovieTopRatedResult] {
        return [MovieTopRatedResult(adult: false,
                            backdrop_path: "/xBKGJQsAIeweesB79KC89FpBrVr.jpg",
                            genre_ids: [18,80],
                            id: 278,
                            original_language: "en",
                            original_title: "The Shawshank Redemption",
                            overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                            popularity: 6.741296,
                            poster_path: "/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg",
                            release_date: "1994-09-10",
                            title: "The Shawshank Redemption",
                            video: false,
                            vote_average: 8.32,
                            vote_count: 5238),
                MovieTopRatedResult(adult: false,
                                    backdrop_path: "/xBKGJQsAIeweesB79KC89FpBrVr.jpg",
                                    genre_ids: [18,80],
                                    id: 278,
                                    original_language: "en",
                                    original_title: "The Shawshank Redemption",
                                    overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                                    popularity: 6.741296,
                                    poster_path: "/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg",
                                    release_date: "1994-09-10",
                                    title: "The Shawshank Redemption",
                                    video: false,
                                    vote_average: 8.32,
                                    vote_count: 5238),
                MovieTopRatedResult(adult: false,
                                    backdrop_path: "/xBKGJQsAIeweesB79KC89FpBrVr.jpg",
                                    genre_ids: [18,80],
                                    id: 278,
                                    original_language: "en",
                                    original_title: "The Shawshank Redemption",
                                    overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                                    popularity: 6.741296,
                                    poster_path: "/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg",
                                    release_date: "1994-09-10",
                                    title: "The Shawshank Redemption",
                                    video: false,
                                    vote_average: 8.32,
                                    vote_count: 5238),
                MovieTopRatedResult(adult: false,
                                    backdrop_path: "/xBKGJQsAIeweesB79KC89FpBrVr.jpg",
                                    genre_ids: [18,80],
                                    id: 278,
                                    original_language: "en",
                                    original_title: "The Shawshank Redemption",
                                    overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                                    popularity: 6.741296,
                                    poster_path: "/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg",
                                    release_date: "1994-09-10",
                                    title: "The Shawshank Redemption",
                                    video: false,
                                    vote_average: 8.32,
                                    vote_count: 5238),
                MovieTopRatedResult(adult: false,
                                    backdrop_path: "/xBKGJQsAIeweesB79KC89FpBrVr.jpg",
                                    genre_ids: [18,80],
                                    id: 278,
                                    original_language: "en",
                                    original_title: "The Shawshank Redemption",
                                    overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                                    popularity: 6.741296,
                                    poster_path: "/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg",
                                    release_date: "1994-09-10",
                                    title: "The Shawshank Redemption",
                                    video: false,
                                    vote_average: 8.32,
                                    vote_count: 5238)]
    }
}
