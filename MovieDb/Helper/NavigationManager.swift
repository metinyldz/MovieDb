//
//  NavigationManager.swift
//  MovieDb
//
//  Created by Metin Yıldız on 2.01.2026.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
}

enum Route: Hashable {
    case castPersonView(id: Int)
}
