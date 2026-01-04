//
//  SplashFinalView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 28.05.2022.
//

import SwiftUI

struct SplashFinalView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .scaledToFill()
            
            Image("backgorundColor")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .scaledToFill()
                .opacity(0.9)
            
            Image("loginAppImage")
                .resizable()
                .scaledToFill()
                .frame(width: 106, height: 149)
            
            VStack {
                Spacer()
                
                HStack {
                    Text("We ")
                        .font(Font.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                    Image("iconHandshake")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 19, height: 19)
                    
                    Text(" movie")
                        .font(Font.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                }
                .frame(maxHeight: 20)
                .padding(.bottom, 90)
            }
        }
    }
}

struct SplashFinalView_Previews: PreviewProvider {
    static var previews: some View {
        SplashFinalView()
    }
}
