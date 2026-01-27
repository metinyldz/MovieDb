//
//  SearchCardView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 20.06.2022.
//

import SwiftUI

struct SearchCardView: View {
    
    var searchResult: SearchMultiContentResult
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(searchResult.poster_path ?? "")")) { image in
                    image
                        .resizable()
                        .frame(width: 70, height: 100)
                } placeholder: {
                    Image("moviePlaceholder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 100)
                }
                
                VStack(alignment: .leading) {
                    Text(getSearchContentTitle())
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(height: 24)
                        .padding(.top, 10)
                        .lineLimit(1)
                    
                    Text("James Wilks, Arnold Schwarzenegger")
                        .font(Font.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .opacity(0.8)
                    
                    Spacer()
                    
                    HStack(spacing: 5) {
                        Image(getIconType())
                            .frame(width: 15, height: 15)
                        
                        Text(getMediaTypeText())
                            .font(Font.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                            .opacity(0.6)
                    }
                    .padding(.bottom, 18)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.trailing, 10)
            }
        }
        .frame(width: 327, height: 100)
        .cornerRadius(8)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 2, y: 2)
    }
    
    private func getSearchContentTitle() -> String {
        return (searchResult.media_type == "tv") ? searchResult.original_name ?? "-" : searchResult.original_title ?? "-"
    }
    
    private func getMediaTypeText() -> String {
        if searchResult.media_type == "tv" {
            return "TV Series"
        } else if searchResult.media_type == "movie" {
            return "Movie"
        } else {
            return "Actor"
        }
    }
    
    private func getIconType() -> String {
        if searchResult.media_type == "tv" {
            return "iconTv"
        } else if searchResult.media_type == "movie" {
            return "iconMovie"
        } else {
            return "iconPerson"
        }
    }
}

#Preview {
    SearchCardView(searchResult: SearchMultiContentResult.all())
}
