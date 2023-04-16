//
//  LoginTextFieldView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 15.04.2023.
//

import SwiftUI

struct LoginTextFieldView: View {
    @Binding var emailText: String
    @Binding var passwordText: String
    
    var body: some View {
        VStack {
            TextField("", text: $emailText)
                .frame(height: 45)
                .padding(.horizontal, 24)
                .background(Color.clear)
                .font(Font.system(size: 17))
                .foregroundColor(Color.white)
                .placeholder(when: emailText.isEmpty) {
                    Text("Email").foregroundColor(.white)
                        .padding(.horizontal, 24)
                }
            
            Divider()
                .background(.white)
                .padding(.horizontal, 24)
                .padding(.top, -8)
            
            SecureField("", text: $passwordText)
                .frame(height: 45)
                .padding(.horizontal, 24)
                .background(Color.clear)
                .font(Font.system(size: 17))
                .foregroundColor(Color.white)
                .placeholder(when: passwordText.isEmpty) {
                    Text("Password").foregroundColor(.white)
                        .padding(.horizontal, 24)
                }
            
            Divider()
                .background(.white)
                .padding(.horizontal, 24)
                .padding(.top, -8)
        } //: VStack
    }
}

struct LoginTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextFieldView(emailText: .constant(""), passwordText: .constant(""))
            .preferredColorScheme(.dark)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
