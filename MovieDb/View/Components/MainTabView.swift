//
//  MainTabView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 25.05.2022.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selection = 0
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        TabView(selection: $selection) {
            MovieView()
                .tabItem {
                    if selection == 0 {
                        Image("iconsTabbarMovieSelected")
                    } else {
                        Image("iconsTabbarMovie")
                    }
                }.tag(0)
            TvSeriesView()
                .tabItem {
                    if selection == 1 {
                        Image("iconsTabbarSerieSelected")
                    } else {
                        Image("iconsTabbarSerie")
                    }
                }.tag(1)
            SearchView()
                .tabItem {
                    if selection == 2 {
                        Image("iconsTabbarSearchSelected")
                    } else {
                        Image("iconsTabbarSearch")
                    }
                }.tag(2)
            ProfileView()
                .tabItem {
                    if selection == 3 {
                        Image("iconsTabbarProfilSelected")
                    } else {
                        Image("iconsTabbarProfil")
                    }
                }.tag(3)
        }
        .environmentObject(ContentBindigs())
    }
}

#Preview {
    MainTabView()
}
