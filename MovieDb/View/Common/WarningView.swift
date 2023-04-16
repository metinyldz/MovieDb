//
//  WarningView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 15.04.2023.
//

import SwiftUI
import Combine

struct CustomWarningView: ViewModifier {
    @Binding var showAlert: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
            if showAlert {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Özel Uyarı Başlık")
                        .font(.headline)
                        .padding()
                    Text("Uyarı mesajınız burada yer alır.")
                        .multilineTextAlignment(.center)
                        .padding()
                    Button(action: {
                        withAnimation {
                            showAlert = false
                        }
                    }) {
                        Text("Tamam")
                            .bold()
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .frame(width: 300, height: 200)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
            }
        }
    }
}

extension View {
    func customAlert(isPresented: Binding<Bool>) -> some View {
        self.modifier(CustomWarningView(showAlert: isPresented))
    }
}
