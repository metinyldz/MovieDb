//
//  MoviePopularList.swift
//  MovieDb
//
//  Created by Metn Yıldız on 25.01.2026.
//

import SwiftUI

struct MoviePopularList: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Popular")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(1)
            
            VStack(spacing: 30) { // TODO: Add api and real response
                getSmallItemCardView()
                getSmallItemCardView()
                getSmallItemCardView()
                getSmallItemCardView()
                getSmallItemCardView()
            }
            .padding(.horizontal)
        }
    }
    
    func getSmallItemCardView() -> some View {
        HStack(spacing: 10) {
            Image("moviePlaceholder")
                .resizable()
                .frame(maxHeight: .infinity)
                .aspectRatio(contentMode: .fill)
                .frame(width: 70)
            
            VStack(spacing: 5) {
                HStack(spacing: .zero) {
                    Text("A Working Man")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                    
                    Image(systemName: "heart")
                        .frame(alignment: .trailing)
                }
                
                Text("Action, Crime, Thriller")
                    .font(.callout)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: .zero) {
                    Image(systemName: "calendar")
                        .foregroundStyle(Color("VibrantBlue"))
                    
                    Spacer()
                    
                    Text("26.03.2025")
                        .font(.caption)
                        .fontWeight(.light)
                        .padding(.horizontal)
                    
                    Text("6.27")
                        .font(.caption)
                        .fontWeight(.light)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
    }
}

struct MoviePopularList_Previews: PreviewProvider {
    static var previews: some View {
        MoviePopularList()
            .previewLayout(.sizeThatFits)
    }
}
