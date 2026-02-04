//
//  CastPersonFooterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 4.02.2026.
//

import SwiftUI

struct CastPersonFooterView: View {
    var castPeople: CastPeopleModel?
    
    var body: some View {
        HStack {
            Text("Born: ")
                .fontWeight(.bold)
                .font(.system(size: 17))
                .opacity(0.8)
                .foregroundColor(.black)
            
            Text(castPeople?.place_of_birth ?? "-")
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
    CastPersonFooterView(castPeople: CastPeopleModel.all())
}
