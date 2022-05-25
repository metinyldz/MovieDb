//
//  RatingView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15.0)
            .fill(Color("VibrantBlue"))
            .frame(width: 61, height: 24)
            .overlay(
                HStack {
                    Spacer()
                    
                    Image("star")
                        .frame(width: 13, height: 13)
                    
                    Spacer()
                    
                    Text("8.9")
                        .bold()
                        .foregroundColor(Color.white)
                        .minimumScaleFactor(0.5)
                        .font(.system(size: 10))
                    
                    Spacer()
                }
            )
            .frame(minWidth: 55, maxWidth: 64, minHeight: 22, maxHeight: 24)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
            .previewLayout(.fixed(width: 69, height: 32))
    }
}
