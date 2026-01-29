//
//  MovieView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 21.04.2025.
//

import SwiftUI

struct MovieView: View {
    @StateObject var movieViewModel = MovieViewModel()
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        MainBackgroundContainer {
            MovieContent()
        }
    }
}

#Preview {
    MovieView()
        .environmentObject(ContentBindigs())
}
