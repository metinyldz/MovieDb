//
//  PopularCardView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 8.05.2022.
//

import SwiftUI

struct PopularCardView: View {
    
    var movieResult: MovieResult
    @State var isFavorite: Bool = false
    @State private var genreText: String = ""
    @State private var date: String = ""
    var genres: [GenreResult]?
    
    @EnvironmentObject var contentBindigs: ContentBindigs

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
                    HStack {
                        Text(movieResult.title ?? "-")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        .frame(height: 24)
                        
                        Spacer()
                        
                        Image(getFavoriteItem(movieResult) ? "heartSelected" : "heart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .scaledToFit()
                            .onTapGesture {
                                !getFavoriteItem(movieResult) ? addContentToUserDefaults() : removeContentToUserDefaults()
                                //isFavorite = !isFavorite
                            }
                    }
                    
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
                        
                        SmallRatingView(rating: "\(movieResult.vote_average ?? 0)")
                            .padding(.horizontal, 4)
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.all, 10)
            }
        }
        .frame(width: 327, height: 100)
        .cornerRadius(8)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 2, y: 2)
        .onAppear {
            getGenres(genreIds: movieResult.genre_ids)
            date = Converter.convertDate(input: movieResult.release_date ?? "", dateType: .date)
        }
    }
    
    private func getFavoriteItem(_ movieResult: MovieResult) -> Bool {
        var temp = false
        
        return UserDefaults.standard.favoriteModel.contains { item in
            temp = (item.contentId == movieResult.id ?? -1)
            return temp
        }
    }
    
    private func getGenres(genreIds: [Int]?) {
        guard let genreIds = genreIds, let genreResult = genres else { return }
        
        var genreIndexs = [GenreResult]()
        
        for genreId in genreIds {
            genreIndexs.append(genreResult.first(where: {$0.id == genreId})!)
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
    
    private func addContentToUserDefaults() {
        let model = FavoriteModel(contentId: movieResult.id ?? -1,
                                  contentUrl: movieResult.poster_path ?? "-",
                                  contentTitle: movieResult.title ?? "-",
                                  contentDate: date)
        UserDefaults.standard.favoriteModel.append(model)
        contentBindigs.favoriteContents.append(model)
    }
    
    private func removeContentToUserDefaults() {
        UserDefaults.standard.favoriteModel.removeAll { item in
            return item.contentId == movieResult.id
        }
        contentBindigs.favoriteContents.removeAll { item in
            return item.contentId == movieResult.id
        }
    }
}

#Preview {
    PopularCardView(movieResult: MovieResult.all().first!)
}

extension UserDefaults {
    var favorites: [FavoriteModel] {
        get {
            array(forKey: "favorites") as? [FavoriteModel] ?? []
        }
        set {
            set(newValue, forKey: "favorites")
        }
    }
}
