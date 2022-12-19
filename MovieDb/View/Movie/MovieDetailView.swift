//
//  MovieDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct MovieDetailView: View {
    
    var content: MovieDetailModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            if content.genres != nil {
                //MARK: - HEADER -
                VStack {
                    ZStack {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(content.poster_path ?? "")")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 400)
                                .clipped()
                                .padding(.top, -50)
                        } placeholder: {
                            Image("moviePlaceholder")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 400)
                                .clipped()
                                .padding(.top, -50)
                        }
                        
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
        //.edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(content: MovieDetailModel.all())
            .previewDevice("iPhone 12 Mini")
    }
}
