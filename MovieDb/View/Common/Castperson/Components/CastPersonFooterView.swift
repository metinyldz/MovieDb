//
//  CastPersonFooterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 4.02.2026.
//

import SwiftUI

struct CastPersonFooterView: View {
    var placeOfBirth: String
    
    var body: some View {
        HStack {
            Text("Born: ")
                .fontWeight(.bold)
                .font(.system(size: 17))
                .opacity(0.8)
                .foregroundColor(.black)
            
            Text(placeOfBirth)
                .fontWeight(.regular)
                .font(.system(size: 17))
                .opacity(0.8)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: 24, alignment: .leading)
        .padding(.horizontal, 24)
    }
}

#Preview {
    CastPersonFooterView(placeOfBirth: "")
}
