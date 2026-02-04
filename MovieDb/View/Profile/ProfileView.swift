//
//  ProfileView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 22.05.2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            MainBackgroundContainer {
                ProfileContentView(viewModel: viewModel)
            }
            .navigationBarTitle("Profile", displayMode: .large)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
            .toolbar { // TODO: Fix the invisible toolbar problem.
                ToolbarItem(placement: .navigationBarTrailing) {
                    logoutButton
                }
            }
        }
    }
    
    var logoutButton: some View {
        Button {
            viewModel.isLogin = false
        } label: {
            Text("Logout")
                .foregroundColor(.white)
                .font(.system(size: 16))
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(ContentBindigs())
}
