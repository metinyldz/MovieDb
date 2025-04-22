//
//  TempMovieView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 21.04.2025.
//

import SwiftUI
 
struct TempMovieView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: .zero) {
                        Color("VibrantBlue")
                            .frame(height: 300)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: .zero) {
                                getImageInformationView()
                                getImageInformationView()
                                getImageInformationView()
                                getImageInformationView()
                                getImageInformationView()
                            }
                            .padding(.horizontal, 24)
                        }
                        .padding(.top, -130)

                        Divider()
                            .padding()
                            .padding(.top, 20)
                        
                        VStack {
                            Text("Popular")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                            
                            ForEach(0..<4) { _ in
                                getSmallItemCardView()
                            }
                            
                        }
                        .padding(.horizontal, 24)
                    }
                }
                .ignoresSafeArea(.all)
                .navigationTitle("Movies")
            }
        }
    }
    
    @ViewBuilder
    func getImageInformationView() -> some View {
        VStack(spacing: 5) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")) { image in
                image
                    .resizable()
                    .frame(width: 260, height: 373)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                Image("moviePlaceholder")
                    .resizable()
                    .frame(width: 260, height: 373)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            HStack(spacing: .zero) {
                Capsule()
                    .frame(width: 60, height: 20)
                    .foregroundStyle(Color("VibrantBlue"))
                    .overlay {
                        HStack(spacing: 5) {
                            Image("star")
                                .resizable()
                                .frame(width: 13, height: 13)
                            
                            Text("8.78")
                                .font(.caption)
                                .foregroundStyle(Color.white)
                        }
                        .padding(.horizontal, 5)
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
            
            Text("The Shawshank Redemption Redemption Redemption")
                .frame(maxWidth: 300, alignment: .leading)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
            
            Text("Drama, Crime")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)
                .fontWeight(.medium)
        }
    }
    
    @ViewBuilder
    func getSmallItemCardView() -> some View {
        HStack(spacing: .zero) {
            Image("moviePlaceholder")
                .resizable()
                .frame(maxHeight: .infinity)
                .frame(width: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(spacing: .zero) {
                
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TempMovieView()
        .environmentObject(ContentBindigs())
}
