//
//  ContentBindigs.swift
//  MovieDb
//
//  Created by Metin Yıldız on 10.06.2022.
//

import Foundation
import SwiftUI

@MainActor class ContentBindigs: ObservableObject {
    
    @Published var moviePageIndex = 0
    @Published var tvPageIndex = 0
    @Published var favoriteContents = UserDefaults.standard.favoriteModel
}
