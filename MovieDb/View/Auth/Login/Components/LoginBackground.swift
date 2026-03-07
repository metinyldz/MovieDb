//
//  LoginBackground.swift
//  MovieDb
//
//  Created by Metin Yıldız on 28.03.2023.
//

import SwiftUI

struct LoginBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Image("group")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height * 1.4, alignment: .center)
                .offset(y: -20)
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    LoginBackground()
}
