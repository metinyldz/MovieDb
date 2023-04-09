//
//  ProfileView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 22.05.2022.
//

import SwiftUI

struct ProfileView: View {
    
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
            } //: ZSTACK
        } //: NAVIGATION
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
