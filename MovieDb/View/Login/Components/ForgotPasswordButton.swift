//
//  ForgotPasswordButton.swift
//  MovieDb
//
//  Created by Metin Yıldız on 24.01.2026.
//

import SwiftUI

struct ForgotPasswordButton: View {
    var body: some View {
        HStack(spacing: .zero) {
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
    }
}

#Preview {
    ForgotPasswordButton()
        .preferredColorScheme(.dark)
}
