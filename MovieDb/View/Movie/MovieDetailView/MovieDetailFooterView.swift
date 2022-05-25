//
//  MovieDetailFooterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 10.05.2022.
//

import SwiftUI

struct MovieDetailFooterView: View {
    var body: some View {
        VStack {
            Text("In Gotham City, mentally-troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: 'The Joker'.")
                .font(Font.system(size: 17))
                .fontWeight(.regular)
                .foregroundColor(Color.black)
            
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
        }
    }
}

struct MovieDetailFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailFooterView()
            .previewLayout(.sizeThatFits)
    }
}
