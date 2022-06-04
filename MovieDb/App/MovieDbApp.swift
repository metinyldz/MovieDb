//
//  MovieDbApp.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

@main
struct MovieDbApp: App {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.white)
        
        UITableView.appearance().backgroundColor = UIColor.clear
        UIScrollView.appearance().backgroundColor = UIColor.clear
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor.white
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .preferredColorScheme(.light)
                
        }
    }
}
