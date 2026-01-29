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
            //let geoGlobal = geometry.frame(in: .global)
            
            ScrollView {
                if content.genres != nil {
                    VStack {
                        //MARK: - HEADER -
                        MovieDetailHeaderView(posterPath: content.poster_path) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .frame(width: geometry.size.width, height: 400)
                        
                        //MARK: - CENTER -
                        MovieDetailCenterView(content: content)
                            .padding(.top, -20)
                        
                        //MARK: - FOOTER -
                        MovieDetailFooterView(content: content)
                            .padding(.horizontal, 24)
                    }
                }
            }
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MovieDetailView(content: MovieDetailModel.all())
}
