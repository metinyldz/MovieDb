//
//  CastPersonHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 4.02.2026.
//

import SwiftUI

struct CastPersonHeaderView: View {
    var castPeople: CastPeopleModel
    var onDismss: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { proxy in
                    let global = proxy.frame(in: .global)
                    
                    CachedAsyncImage(
                        url: "https://image.tmdb.org/t/p/w500\(castPeople.profile_path ?? "")",
                        contentMode: .fill
                    ) {
                        Image("moviePlaceholder")
                            .resizable()
                            .offset(y: global.minY > 0 ? -global.minY : 0)
                            .frame(height: global.minY > 0 ? (UIScreen.main.bounds.height/2.2) + global.minY :  UIScreen.main.bounds.height/2.2)
                    }
                    .offset(y: global.minY > 0 ? -global.minY : 0)
                    .frame(height: global.minY > 0 ? (UIScreen.main.bounds.height/2.2) + global.minY :  UIScreen.main.bounds.height/2.2)
                }
                .padding(.bottom, 10)
            }
            
            .overlay(alignment: .topLeading, content: {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.white)
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        onDismss()
                    }
                    .padding([.leading, .trailing], 24)
            })
        }
    }
}

#Preview {
    CastPersonHeaderView(castPeople: CastPeopleModel.all()) {}
}
