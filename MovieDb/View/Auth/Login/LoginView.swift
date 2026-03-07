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
        switch viewModel.loginState {
        case .idle:
            emptyView
        case .loading:
            loadingView
        case .loaded:
            loadedView
        }
    }
    
    var emptyView: some View {
        LoginContainer { }
    }
    
    var loadingView: some View {
        LoginContainer {
            ProgressView().tint(Color.white)
        }
    }
    
    var loadedView: some View {
        LoginContainer {
            LoginContentView(viewModel: viewModel)
        }
    }
}

#Preview {
    LoginView(
        emailText: .constant(""),
        passwordText: .constant("")
    )
}
