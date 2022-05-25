//
//  MovieHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 7.05.2022.
//

import SwiftUI

struct MovieHeaderView: View {
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(height: 120.0)
                    .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(Color("VibrantBlue"))
                
                Spacer()
            } //: VStack
            
            PagingView(config: .init(margin: 20, spacing: -40)) {
                Group {
                    Image("moviePlaceholder")
                        .resizable()
                        .frame(width: 260, height: 373)
                    Image("moviePlaceholder")
                        .resizable()
                        .frame(width: 260, height: 373)
                    Image("moviePlaceholder")
                        .resizable()
                        .frame(width: 260, height: 373)
                } //: GROUP
                .mask(RoundedRectangle(cornerRadius: 10))
                .aspectRatio(1.4, contentMode: .fit)
                
            } //: PAGING
            .frame(height: 373)
            .padding(.vertical, 20)
            
        } //: ZStack
    }
}

struct MovieHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHeaderView()
            .previewDisplayName("iPhone 12 Mini")
    }
}
