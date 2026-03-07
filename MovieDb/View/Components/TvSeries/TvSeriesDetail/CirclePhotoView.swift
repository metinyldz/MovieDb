//
//  CirclePhotoView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 17.05.2022.
//

import SwiftUI

struct CirclePhotoView: View {
    
    var castDetail: TvSerieCastDetailModel
    
    var body: some View {
        VStack {
            ZStack {
                CachedAsyncImage(
                    posterPath: "https://image.tmdb.org/t/p/w500\(castDetail.profile_path ?? "")",
                    contentMode: .fill
                ) {
                    Image("moviePlaceholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                }
                .frame(width: 70, height: 70)
                .cornerRadius(35)
            }
            
            Text(castDetail.original_name ?? "-")
                .fontWeight(.regular)
                .font(.system(size: 15))
                .frame(width: 100, height: 18)
            
        }
    }
}

#Preview {
    CirclePhotoView(castDetail: (TvSerieCastModel.all().first!.cast?.first!)!)
}
