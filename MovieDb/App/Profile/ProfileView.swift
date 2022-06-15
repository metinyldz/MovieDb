//
//  ProfileView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 22.05.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    //MARK: - HEADER -
                    
                    ZStack {
                        VStack {
                            Rectangle()
                                .frame(height: 120.0)
                                .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(Color("VibrantBlue"))
                            
                            Spacer()
                        } //: VStack
                        
                        VStack(alignment: .leading) {
                            Text("Hello \(Image("iconHandshake"))")
                                .font(Font.system(size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .frame(height: 30)
                            
                            Text("Jessie Doe")
                                .font(Font.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(height: 30)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
                        .padding(.horizontal, 24)
                        .padding(.top, -30)
                        
                    } //: ZSTACK
                    
                    //MARK: - CENTER -
                    
                    VStack {
                        Text("Favorite")
                            .font(Font.system(size: 22))
                            .fontWeight(.bold)
                    } //: VSTACK
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 10)
                    
                    //MARK: - FOOTER -

                    ForEach(contentBindigs.favoriteContents, id: \.self) { item in
//                        NavigationLink(destination: MovieDetailView(), isActive: $isActive) {
                        ProfileFavoriteCardView(favoriteItem: item)
                                .padding(.vertical, 10)
//                        } //: LINK
                    }
                    
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
