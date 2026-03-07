//
//  MovieDetailCenterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 10.05.2022.
//

import SwiftUI

struct MovieDetailCenterView: View, Equatable {
    
    let viewModel: MovieDetailCenterViewModel
    
    init(content: MovieDetailModel) {
        self.viewModel = MovieDetailCenterViewModel(content: content)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            SmallRatingView(rating: viewModel.rating)
            
            Text(viewModel.title)
                .font(Font.system(size: 28))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(viewModel.genreText)
                .font(Font.system(size: 15))
                .fontWeight(.medium)
                .foregroundColor(.black)

            HStack {
                Image("time")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                
                Text(viewModel.runtimeText)
                    .font(Font.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .opacity(0.6)
                
                Divider()
                    .padding(.horizontal, 10)
                    .frame(height: 12)
                
                Image("calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                
                Text(viewModel.releaseDateText)
                    .font(Font.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .opacity(0.6)
                
                Divider()
                    .padding(.horizontal, 10)
                    .frame(height: 12)
            }
            
            Divider()
                .padding(.vertical, 20)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        
    }
    
    static func == (lhs: MovieDetailCenterView, rhs: MovieDetailCenterView) -> Bool {
        return lhs.viewModel.movieId == rhs.viewModel.movieId
    }
}
#Preview {
    MovieDetailCenterView(content: MovieDetailModel.all())
        .previewLayout(.sizeThatFits)
}
