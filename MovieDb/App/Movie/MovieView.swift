//
//  MovieView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct MovieView: View {
    
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    //MARK: - HEADER -
                    MovieHeaderView()
                     
                    //MARK: - CENTER -
                    
                    MovieDescriptionView()
                        .padding(.horizontal, 24)
                    
                    Divider()
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)
                    
                    //MARK: - FOOTER -
                    
                    VStack {
                        Text("Popular")
                            .font(Font.system(size: 22))
                            .fontWeight(.bold)
                    } //: VSTACK
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 10)
                    
                    ForEach(1...7, id: \.self) { _ in
                        NavigationLink(destination: MovieDetailView(), isActive: $isActive) {
                            PopularCardView()
                                .padding(.vertical, 10)
                        } //: LINK
                    }
                    
                } //: SCROLL
                .navigationBarTitle("Movies", displayMode: .large)
                .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
            } //: ZStack
            .navigationViewStyle(.stack)
        } //: NAVIGATION
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .previewDisplayName("iPhone 12 Mini")
            .preferredColorScheme(.light)
    }
}
