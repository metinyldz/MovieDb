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
        NavigationView {
            ZStack {
                LoginBackground()
                
                VStack {
                    Image("loginAppImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 106, height: 149)
                    
                    LoginTextFieldView(emailText: $viewModel.emailText, passwordText: $viewModel.passwordText)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            // TODO: - Action Code -
                        } label: {
                            Text("Forgot Password?")
                                .foregroundColor(.white)
                                .font(Font.system(size: 12))
                                .fontWeight(.regular)
                                .frame(height: 14, alignment: .trailing)
                                .padding(.horizontal, 24)
                        }
                    }
                    
                    LoginFooterView(showAlert: $viewModel.showAlert, emailText: $viewModel.emailText, passwordText: $viewModel.passwordText)
                }
                
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

#Preview {
    LoginView(emailText: .constant(""), passwordText: .constant(""))
}
