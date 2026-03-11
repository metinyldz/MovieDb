//
//  RootView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct RootView: View {
    @AppStorage("isLogin") var isLogin: Bool = false
    
    var body: some View {
        if isLogin {
            MainTabView()
                .navigationBarHidden(true)
        } else {
            LoginView(emailText: .constant(""), passwordText: .constant(""))
                .navigationBarHidden(true)
        }
    }
}

#Preview {
    RootView()
        .preferredColorScheme(.light)
}
