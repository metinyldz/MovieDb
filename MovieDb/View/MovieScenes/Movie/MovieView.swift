//
//  TempMovieView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 21.04.2025.
//

import SwiftUI
 
struct MovieView: View {
    @StateObject var movieViewModel = MovieViewModel()
    @EnvironmentObject var contentBindigs: ContentBindigs
    
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
                        
                        VStack(spacing: 30) {
                            Text("Popular")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                            
                            VStack(spacing: 30) {
                                getSmallItemCardView()
                                getSmallItemCardView()
                                getSmallItemCardView()
                                getSmallItemCardView()
                                getSmallItemCardView()
                            }
                            .padding(.horizontal)
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
            
            SmallRatingView(rating: "8.78")
            
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

#Preview {
    MovieView()
        .environmentObject(ContentBindigs())
}

