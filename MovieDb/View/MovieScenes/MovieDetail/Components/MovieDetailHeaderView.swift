//
//  MovieDetailHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2026.
//

import SwiftUI

struct MovieDetailHeaderView: View {
    var posterPath: String?
    var onDismiss: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            let imageGlobal = geometry.frame(in: .global)
            
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width,
                           height: imageGlobal.minY > 0 ? max(400, imageGlobal.minY + 400) : 400)
                    .clipped()
                    .offset(y: imageGlobal.minY > 0 ? -imageGlobal.minY : 0)
            } placeholder: {
                Image("moviePlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width,
                           height: imageGlobal.minY > 0 ? max(400, imageGlobal.minY + 400) : 400)
                    .clipped()
                    .offset(y: imageGlobal.minY > 0 ? -imageGlobal.minY : 0)
            }
        }
        .frame(height: 400)
        .overlay(
            Image(systemName: "arrow.left")
                .foregroundColor(Color.white)
                .frame(width: 25, height: 25)
                .onTapGesture {
                    onDismiss()
                }
                .padding(32)
        , alignment: .topLeading)
    }
}

#Preview {
    MovieDetailHeaderView(posterPath: "/w46Vw536HwNnEzOa7J24YH9DPRS.jpg", onDismiss: {})
}
