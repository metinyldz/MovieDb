//
//  MovieDetailHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2026.
//

import SwiftUI

struct MovieDetailHeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var posterPath: String = ""
    
    init(posterPath: String) {
        self.posterPath = posterPath
    }
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { proxy in
                    let global = proxy.frame(in: .global)
                    // Header
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                        image
                            .resizable()
                            .offset(y: global.minY > 0 ? -global.minY : 0)
                            .frame(height: global.minY > 0 ? (400) + global.minY :  400)
                    } placeholder: {
                        Image("moviePlaceholder")
                            .resizable()
                            .offset(y: global.minY > 0 ? -global.minY : 0)
                            .frame(height: global.minY > 0 ? (400) + global.minY :  400)
                    }
                }
            }
        }
    }
}

GeometryReader { imageGeometry in
    let imageGlobal = imageGeometry.frame(in: .global)
    
    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(content.poster_path ?? "")")) { image in
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: geometry.size.width,
                   height: imageGlobal.minY > 0 ? max(400, imageGlobal.minY + 400) : 400)
            .clipped()
            .offset(y: imageGlobal.minY > 0 ? -imageGlobal.minY : 0)
    } placeholder: {
        Image("moviePlaceholder")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: geometry.size.width,
                   height: imageGlobal.minY > 0 ? max(400, imageGlobal.minY + 400) : 400)
            .clipped()
            .offset(y: imageGlobal.minY > 0 ? -imageGlobal.minY : 0)
    }
}

#Preview {
    MovieDetailHeaderView(posterPath: "")
}
