//
//  LoginFooterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 15.04.2023.
//

import SwiftUI

struct LoginFooterView: View {
    @Binding var emailText: String
    @Binding var passwordText: String
    @AppStorage("isLogin") var isLogin: Bool = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: MainTabView(), isActive: $isLogin) {
                Button {
                    if !(emailText.isEmpty && passwordText.isEmpty) {
                        isLogin = true
                    } else {
                        isLogin = false
                    }
                } label: {
                    Text("Login")
                        .foregroundColor(Color("VibrantBlue"))
                        .font(Font.system(size: 17))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, minHeight: 45, maxHeight: 45)
                        .padding(.horizontal, 24)
                } //: BUTTON
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                .padding(.horizontal, 24)
                .padding(.top, 48)
                .padding(.bottom, 24)
            } //: LINK
            
            HStack {
                Text("Don’t have an account? ")
                    .foregroundColor(Color(red: 171/255, green: 180/255, blue: 189/255))
                    .font(Font.system(size: 12))
                    .fontWeight(.regular)
                
                Button {
                    // TODO: - Action Code -
                } label: {
                    Text("Register Now")
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 12))
                        .fontWeight(.medium)
                        .padding(.horizontal, -8)
                }
            } //: HSTACK
        } //: VStack
    }
}

struct LoginFooterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFooterView(emailText: .constant(""), passwordText: .constant(""))
    }
}
