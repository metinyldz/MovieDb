//
//  SplashView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 28.05.2022.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                ContentView()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .tvSeriesDetail(let id):
                            TvSeriesDetailView(id: id)
                        case .castPersonView(let id):
                            CastPersonView(id: id)
                        }
                    }
            } else {
                SplashFinalView()
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
