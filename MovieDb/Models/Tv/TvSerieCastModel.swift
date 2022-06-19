//
//  TvSerieCastModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 19.06.2022.
//

import Foundation

struct TvSerieCastModel: Codable, Hashable {
    var cast: [TvSerieCastDetailModel]?
    var crew: [TvSerieCrewDetailModel]?
    var id: Int?
    
    static func all() -> [TvSerieCastModel] {
        return [TvSerieCastModel(cast: [TvSerieCastDetailModel(adult: false,
                                                               gender: 1,
                                                               id: 1223786,
                                                               known_for_department: "Acting",
                                                               name: "Emilia Clarke",
                                                               original_name: "Emilia Clarke",
                                                               popularity: 14.322,
                                                               profile_path: "/r6i4C3kYrBRzUzZ8JKAHYQ0T0dD.jpg",
                                                               character: "Daenerys Targaryen",
                                                               credit_id: "5256c8af19c2956ff60479f6",
                                                               order: 0)],
                                 crew: [TvSerieCrewDetailModel(adult: false,
                                                               gender: 2,
                                                               id: 33316,
                                                               known_for_department: "Directing",
                                                               name: "David Nutter",
                                                               original_name: "David Nutter",
                                                               popularity: 2.265,
                                                               profile_path: nil,
                                                               credit_id: "5ceab0ab92514175e8bb5caf",
                                                               department: "Production",
                                                               job: "Executive Producer")],
                                 id: 1399)]
    }
}

struct TvSerieCastDetailModel: Codable, Hashable {
    var adult: Bool?
    var gender: Int?
    var id: Int?
    var known_for_department: String?
    var name: String?
    var original_name: String?
    var popularity: Double?
    var profile_path: String?
    var character: String?
    var credit_id: String?
    var order: Int?
}


struct TvSerieCrewDetailModel: Codable, Hashable {
    var adult: Bool?
    var gender: Int?
    var id: Int?
    var known_for_department: String?
    var name: String?
    var original_name: String?
    var popularity: Double?
    var profile_path: String?
    var credit_id: String?
    var department: String?
    var job: String?
}
