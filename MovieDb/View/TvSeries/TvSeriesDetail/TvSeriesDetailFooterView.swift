//
//  TvSeriesDetailFooterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 17.05.2022.
//

import SwiftUI

struct TvSeriesDetailFooterView: View {
    var body: some View {
        VStack {
            Text("Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years.")
                .font(Font.system(size: 17))
                .fontWeight(.regular)
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 24)
            
            VStack {
                ZStack {
                    Capsule()
                        .fill(Color(.sRGB, red: 57/255, green: 58/255, blue: 59/255))

                    Text("8 Seasons")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                        .fontWeight(.black)
                        .frame(maxWidth: .infinity, maxHeight: 14)
                } //: ZSTACK
                .frame(width: 81, height: 24)
            } //: VSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            
            HStack {
                Text("Creators: ")
                    .font(Font.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                
                Text("David Benioff, D.B. Weiss")
                    .font(Font.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("VibrantBlue"))
                
                Spacer()
            } //: HSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            
            VStack {
                Text("Cast")
                    .font(Font.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(1...7, id: \.self) { _ in
                            CirclePhotoView()
                        } //: FOREACH
                    } //: HSTACK
                } //: SCROLL
                .edgesIgnoringSafeArea(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .padding(.bottom, 21)
            } //: VSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
        } //: VSTACK
        
    }
}

struct TvSeriesDetailFooterView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesDetailFooterView()
            .previewLayout(.sizeThatFits)
    }
}
