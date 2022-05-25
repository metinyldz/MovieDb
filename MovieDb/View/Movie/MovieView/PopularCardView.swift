//
//  PopularCardView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct PopularCardView: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Image("moviePlaceholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 100)
                
                VStack(alignment: .leading) {
                    Text("Joker")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(height: 24)
                    
                    Text("Crime, Drama, Thriller")
                        .font(Font.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .padding(.vertical, 5)
                        .opacity(0.8)
                        .frame(height: 18)
                    
                    HStack {
                        Image("calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                        
                        Text("04.11.2019")
                            .font(Font.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                            .padding(.all, 5)
                            .opacity(0.6)
                            .frame(height: 14)
                        
                        Divider()
                            .frame(height: 12)
                        
                        RatingView()
                            .padding(.horizontal, 4)
                        
                        Spacer()
                    } //: HSTACK
                } //: VSTACK
                .frame(maxWidth: .infinity)
                .padding(.all, 10)
            } //: HSTACK
        } //: ZSTACK
        .frame(width: 327, height: 100)
        .cornerRadius(8)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 2, y: 2)
    }
}

struct PopularCardView_Previews: PreviewProvider {
    static var previews: some View {
        PopularCardView()
            .previewLayout(.fixed(width: 345, height: 130))
    }
}
