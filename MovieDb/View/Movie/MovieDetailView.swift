//
//  MovieDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var content: MovieDetailModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if content.genres != nil {
                    VStack {
                        //MARK: - HEADER -
                        GeometryReader { imageGeometry in
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(content.poster_path ?? "")")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: max(400, imageGeometry.frame(in: .global).minY + 400))
                                    .clipped()
                                    .offset(y: -imageGeometry.frame(in: .global).minY)
                            } placeholder: {
                                Image("moviePlaceholder")
                                    .resizable()
                            }
                        }
                        .frame(height: 400)
                        
                        //MARK: - CENTER -
                        MovieDetailCenterView(content: content)
                            .padding(.top, -20)
                        
                        //MARK: - FOOTER -
                        MovieDetailFooterView(content: content)
                            .padding(.horizontal, 24)
                    } //: VStack
                }
            } //: Scroll
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
            .overlay(
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.white)
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .padding(32)
            , alignment: .topLeading)
        }
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
                            .frame(height: global.minY > 0 ? (400) + global.minY :  400)
                    } placeholder: {
                        Image("moviePlaceholder")
                            .resizable()
                            .offset(y: global.minY > 0 ? -global.minY : 0)
                            .frame(height: global.minY > 0 ? (400) + global.minY :  400)
                    }
                }
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
