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
        ScrollView {
            LazyVStack {
                if let _ = content.genres {
                    // MARK: - HEADER -
                    MovieDetailHeaderView(posterPath: content.poster_path) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .frame(height: 400)
                    .frame(maxWidth: .infinity)
                    
                    // MARK: - CENTER -
                    MovieDetailCenterView(content: content)
                        .padding(.top, -20)
                    
                    // MARK: - FOOTER -
                    MovieDetailFooterView(content: content)
                        .padding(.horizontal, 24)
                }
            }
        }
        .background(Color("BackgroundColor"))
        .navigationBarHidden(true)
    }
}

#Preview {
    MovieDetailView(content: MovieDetailModel.all())
}
