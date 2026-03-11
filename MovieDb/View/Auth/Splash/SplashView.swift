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
                RootView()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .tvSeriesDetail(let id):
                            TvSeriesDetailView(id: id)
                        case .castPersonView(let id):
                            CastPersonView(id: id)
                        case .movieDetail(let id):
                            MovieDetailView(id: id)
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

#Preview {
    SplashView()
}
