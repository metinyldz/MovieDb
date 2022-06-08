//
//  GenreModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 23.12.2021.
//

import Foundation

struct GenreModel: Codable {
    static var movieInstance: [GenreResult] = []
    static var tvInstance: [GenreResult] = []
    
    var genres: [GenreResult]
}

struct GenreResult: Codable {
    var id: Int?
    var name: String?
}
