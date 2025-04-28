//
//  SmallRatingView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 28.04.2025.
//

import SwiftUI

struct SmallRatingView: View {
    
    var rating: String
    
    var body: some View {
        HStack(spacing: .zero) {
            Capsule()
                .frame(width: 60, height: 20)
                .foregroundStyle(Color("VibrantBlue"))
                .overlay {
                    HStack(spacing: 5) {
                        Image("star")
                            .resizable()
                            .frame(width: 13, height: 13)
                        
                        Text(rating)
                            .font(.caption)
                            .foregroundStyle(Color.white)
                    }
                    .padding(.horizontal, 5)
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top)
    }
}

#Preview {
    SmallRatingView(rating: "8.78")
}
