//
//  ProfileView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 22.05.2022.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("isLogin") var isLogin: Bool = false
    
    var body: some View {
        MainBackgroundContainer {
            ScrollView(showsIndicators: false) {
                //MARK: - HEADER -
                ProfileViewHeader()
                
                ProfileViewList()
            }
            .navigationBarTitle("Profile", displayMode: .large)
            .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
        }
        .toolbar { // TODO: Fix the invisible toolbar problem.
            Button {
                isLogin.toggle()
            } label: {
                Text("Logout")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(ContentBindigs())
}
