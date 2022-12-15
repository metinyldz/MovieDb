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
            /*
            HStack {
                Text("Director: ")
                    .font(Font.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                
                Text("Todd Phillips")
                    .font(Font.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("VibrantBlue"))
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 20)
             */
        }
        .padding(.bottom, 10)
    }
}

struct MovieDetailFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailFooterView(content: MovieDetailModel.all())
            .previewLayout(.sizeThatFits)
    }
}
