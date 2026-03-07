//
//  LoginContentView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 24.01.2026.
//

import SwiftUI

struct LoginContentView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: .zero) {
            LoginLogoView()
            
            LoginTextFieldView(
                emailText: $viewModel.emailText,
                passwordText: $viewModel.passwordText
            )
            .ignoresSafeArea(.keyboard, edges: .bottom)
            
            ForgotPasswordButton()
            
            LoginFooterView(
                showAlert: $viewModel.showAlert,
                emailText: $viewModel.emailText,
                passwordText: $viewModel.passwordText
            )
        }
    }
}

#Preview {
    LoginContentView(viewModel: LoginViewModel())
        .preferredColorScheme(.dark)
}
