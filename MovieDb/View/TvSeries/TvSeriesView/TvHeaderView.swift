//
//  TvHeaderView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 30.05.2022.
//

import SwiftUI

struct TvHeaderView: View {
    
//    @Binding var items: [MovieTopRatedResult]
    @State private var isActive = false
//    @State static var index = 0
    
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
                    NavigationLink(destination: MovieLocationView(), isActive: $isActive) {
                        Image("moviePlaceholder")
                            .resizable()
                            .frame(width: 260, height: 373)
                    }.isDetailLink(false).buttonStyle(.plain)
                    
                    NavigationLink(destination: MovieLocationView(), isActive: $isActive) {
                        Image("moviePlaceholder")
                            .resizable()
                            .frame(width: 260, height: 373)
                    }.isDetailLink(false).buttonStyle(.plain)

                    NavigationLink(destination: MovieLocationView(), isActive: $isActive) {
                        Image("moviePlaceholder")
                            .resizable()
                            .frame(width: 260, height: 373)
                    }.isDetailLink(false).buttonStyle(.plain)
                } //: GROUP
                .mask(RoundedRectangle(cornerRadius: 10))
                .aspectRatio(1.4, contentMode: .fit)
                
            } //: PAGING
            .frame(height: 373)
            .padding(.vertical, 20)
            
        } //: ZStack
    }
}

struct TvHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TvHeaderView()
    }
}
