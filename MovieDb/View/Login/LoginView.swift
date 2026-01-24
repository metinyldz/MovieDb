//
//  LoginView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 29.01.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @Binding var emailText: String
    @Binding var passwordText: String
    
    var body: some View {
        ZStack {
            LoginBackground()
            
            switch viewModel.loginState {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView().tint(Color.white)
            case .loaded:
                LoginContentView(viewModel: viewModel)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    LoginView(emailText: .constant(""), passwordText: .constant(""))
}
