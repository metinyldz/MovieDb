//
//  LoginView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 22.05.2022.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var emailText: String
    @Binding var passwordText: String
    @AppStorage("isLogin") var isLogin: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("VibrantBlue")
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()
                    
                    // MARK: - HEADER -
                    
                    Image("loginAppImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 106, height: 149)
                    
                    // MARK: - CENTER -
                    
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
                        .padding(.horizontal, 24)
                        .padding(.top, -8)
                    
                    // MARK: - FOOTER -
                    
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
                    
                    Spacer()
                } //: VSTACK
                .navigationBarBackButtonHidden(true)
                .edgesIgnoringSafeArea(.all)
                .background(
                    GeometryReader { geometry in
                        Image("group")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height*1.5)
                            .edgesIgnoringSafeArea(.all)
                    } //: GeometryReader
                )
            } //: ZStack
        } //: NAVIGATION
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(emailText: .constant(""), passwordText: .constant(""))
            .previewDevice("iPhone 12 Mini")
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
