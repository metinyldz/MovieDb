//
//  PopularCardView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct PopularCardView: View {
    
    @State var movieResult: MovieResult
    @State private var genreText: String = ""
    @State private var date: String = ""
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieResult.poster_path ?? "")")) { image in
                    image
                        .resizable()
                        .frame(width: 70, height: 100)
                } placeholder: {
                    Image("moviePlaceholder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 100)
                }
                
                VStack(alignment: .leading) {
                    Text(movieResult.title ?? "-")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(height: 24)
                    
                    Text(genreText)
                        .font(Font.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .padding(.vertical, 5)
                        .opacity(0.8)
                        .frame(height: 18)
                    
                    HStack {
                        Image("calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                        
                        Text(date)
                            .font(Font.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                            .padding(.all, 5)
                            .opacity(0.6)
                            .frame(height: 14)
                        
                        Divider()
                            .frame(height: 12)
                        
                        RatingView(rating: "\(movieResult.vote_average ?? 0)")
                            .padding(.horizontal, 4)
                        
                        Spacer()
                    } //: HSTACK
                } //: VSTACK
                .frame(maxWidth: .infinity)
                .padding(.all, 10)
            } //: HSTACK
        } //: ZSTACK
        .frame(width: 327, height: 100)
        .cornerRadius(8)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 2, y: 2)
        .onAppear {
            getGenres(genreIds: movieResult.genre_ids)
            date = Converter.convertDate(input: movieResult.release_date ?? "", dateType: .date)
        }
    }
    
    private func getGenres(genreIds: [Int]?) {
        guard let genreIds = genreIds else { return }
        
        var genreIndexs = [GenreResult]()
        
        for genreId in genreIds {
            genreIndexs.append(GenreModel.movieInstance.first(where: {$0.id == genreId})!)
        }
        
        genreText = convertGenresToString(genreIndexs)
    }
    
    private func convertGenresToString(_ genres: [GenreResult]) -> String {
        var text = ""
        for genre in genres {
            if genres.last!.id == genre.id {
                text += genre.name ?? "-"
                break
            }
            text += "\(genre.name ?? "-"), "
        }
        return text
    }
    
}

struct PopularCardView_Previews: PreviewProvider {
    static var previews: some View {
        PopularCardView(movieResult: MovieResult.all().first!)
            .previewLayout(.fixed(width: 345, height: 130))
    }
}
