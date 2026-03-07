//
//  MovieDetailFooterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 10.05.2022.
//

import SwiftUI

struct MovieDetailFooterView: View {
    
    var content: MovieDetailModel
    
    var body: some View {
        VStack {
            Text(content.overview ?? "-")
                .font(Font.system(size: 17))
                .fontWeight(.regular)
                .foregroundColor(Color.black)
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    MovieDetailFooterView(content: MovieDetailModel.all())
        .previewLayout(.sizeThatFits)
}
