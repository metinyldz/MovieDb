//
//  Movie.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct Movie: Identifiable {
    var id = UUID().uuidString
    var movieImage: String
}
