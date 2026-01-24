//
//  LoginLogoView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 24.01.2026.
//

import SwiftUI

struct LoginLogoView: View {
    var body: some View {
        Image("loginAppImage")
            .resizable()
            .scaledToFit()
            .frame(width: 106, height: 149)
    }
}

#Preview {
    LoginLogoView()
        .preferredColorScheme(.dark)
}
