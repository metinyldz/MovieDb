//
//  LoginContainer.swift
//  MovieDb
//
//  Created by Metin Yıldız on 25.01.2026.
//

import SwiftUI

struct LoginContainer<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            LoginBackground()
            content
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
