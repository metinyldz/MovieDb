//
//  ProfielViewHeader.swift
//  MovieDb
//
//  Created by Metin Yıldız on 12.02.2023.
//

import SwiftUI

struct ProfielViewHeader: View {
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(height: 120.0)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color("VibrantBlue"))
                
                Spacer()
            } //: VStack
            
            VStack(alignment: .leading) {
                Text("Hello \(Image("iconHandshake"))")
                    .font(Font.system(size: 20))
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .frame(height: 30)
                
                Text("Jessie Doe")
                    .font(Font.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(height: 30)
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.top, -30)
        }
    }
}

struct ProfielViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfielViewHeader()
    }
}
