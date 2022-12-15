//
//  ContentBindigs.swift
//  MovieDb
//
//  Created by Metin Yıldız on 10.06.2022.
//

import Foundation
import SwiftUI

@MainActor class ContentBindigs: ObservableObject {
    /* PROTOCOL PROPERTIES */
//    @Published var movieTopRatedResult = [MovieTopRatedResult]()
//    @Published var movieResult = [MovieResult]()
//    
//    @Published var tvTopRatedResult = [TvTopRatedResult]()
//    @Published var tvSeriesResult = [TvSeriesResult]()
    
    @Published var moviePageIndex = 0
    @Published var tvPageIndex = 0
    @Published var favoriteContents = UserDefaults.standard.favoriteModel
}
