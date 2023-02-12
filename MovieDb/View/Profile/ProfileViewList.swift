//
//  ProfileViewList.swift
//  MovieDb
//
//  Created by Metin Yıldız on 12.02.2023.
//

import SwiftUI

struct ProfileViewList: View {
    
    @EnvironmentObject var contentBindigs: ContentBindigs
    
    var body: some View {
        //MARK: - CENTER -
        VStack {
            Text("Favorite")
                .font(Font.system(size: 22))
                .fontWeight(.bold)
        } //: VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.bottom, 10)
        
        //MARK: - FOOTER -
        ForEach(contentBindigs.favoriteContents, id: \.self) { item in
            ProfileFavoriteCardView(favoriteItem: item)
                .padding(.vertical, 10)
        }
    }
}

struct ProfileViewList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewList()
            .environmentObject(ContentBindigs())
    }
}
