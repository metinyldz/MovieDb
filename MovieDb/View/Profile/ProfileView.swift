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
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    //MARK: - HEADER -
                    ProfileViewHeader()
                    
                    ProfileViewList()
                } //: SCROLL
                .navigationBarTitle("Profile", displayMode: .large)
                .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
                //.navigationBarItem
            } //: ZSTACK
            .toolbar {
                Button {
                    isLogin.toggle()
                } label: {
                    Text("Logout")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
            }
        } //: NAVIGATION
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ContentBindigs())
    }
}
