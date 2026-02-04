//
//  CastPersonCenterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 4.02.2026.
//

import SwiftUI

struct CastPersonCenterView: View {
    var castPeople: CastPeopleModel?
    
    var body: some View {
        Text(castPeople?.name ?? "")
            .fontWeight(.bold)
            .font(.system(size: 28))
            .frame(height: 34)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.top, 20)
        
        Text(castPeople?.biography ?? "-")
            .fontWeight(.regular)
            .font(.system(size: 17))
            .opacity(0.8)
            .foregroundColor(.black)
            .padding(.horizontal, 24)
    }
}

#Preview {
    CastPersonCenterView(castPeople: CastPeopleModel.all())
}
