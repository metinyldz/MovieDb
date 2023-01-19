//
//  MovieDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct MovieDetailView: View {
    
    var content: MovieDetailModel
    
    var body: some View {
        ScrollView {
            if content.genres != nil {
                VStack {
                    //MARK: - HEADER -
                    MovieDetailHeaderView(posterPath: content.poster_path ?? "")
                    
                    Spacer()
                    
                    //MARK: - CENTER -
                    MovieDetailCenterView(content: content)
                        .padding(.top, -24)
                    
                    //MARK: - FOOTER -
                    MovieDetailFooterView(content: content)
                        .padding(.horizontal, 24)
                } //: VStack
            }
        } //: Scroll
        .background(Color("BackgroundColor"))
        .navigationBarHidden(true)
    }
}

struct MovieDetailHeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var posterPath: String = ""
    
    init(posterPath: String) {
        self.posterPath = posterPath
    }
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { proxy in
                    let global = proxy.frame(in: .global)
                    // Header
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                        image
                            .resizable()
                            .offset(y: global.minY > 0 ? -global.minY : 0)
                            .frame(height: global.minY > 0 ? (UIScreen.main.bounds.height/2.2) + global.minY :  UIScreen.main.bounds.height/2.2)
                    } placeholder: {
                        Image("moviePlaceholder")
                            .resizable()
                            .offset(y: global.minY > 0 ? -global.minY : 0)
                            .frame(height: global.minY > 0 ? (UIScreen.main.bounds.height/2.2) + global.minY :  UIScreen.main.bounds.height/2.2)
                    }
                }
                .frame(height: UIScreen.main.bounds.height/2.2)
            } //: VStack
            
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color.white)
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .padding([.leading, .trailing], 24)
                    
                    Spacer()
                } //: HStack
                .frame(maxWidth: .infinity, maxHeight: 50)
                
                Spacer()
            } //: VStack
        } //: ZStack
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(content: MovieDetailModel.all())
            .previewDevice("iPhone 12 Mini")
    }
}
