//
//  SplashView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 28.05.2022.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some View {
        VStack {
            NavigationStack(path: $navigationManager.path) {
                if isActive {
                    ContentView()
                } else {
                    SplashFinalView()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewDevice("iPhone 12 Mini")
    }
}
