//
//  SearchView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 17.05.2022.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
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
                        SearchBar(text: $searchText)
                            .padding(.top, -30)
                            .padding(.horizontal, 24)
                    } //: ZSTACK
                    
                    //MARK: - CENTER -
                    
                    // TODO: - Arama yapıldığında Kartları koy buraya. -
                    
                    // TODO: Eğer arama sonucu yok ise foto göster -
                    
                    //MARK: - FOOTER -

                    
                } //: SCROLL
                .navigationBarTitle("Search", displayMode: .large)
                .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
            } //: ZSTACK
        } //: NAVIGATION
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
