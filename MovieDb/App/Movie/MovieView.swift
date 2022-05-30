//
//  MovieView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct MovieView: View {
    
    @ObservedObject var movieViewModel = MovieViewModel()
    
    @State private var isActive = false
    @State var movieHeaderItems = [MovieTopRatedResult]()
    @State var movieDescriptionItem = MovieDescriptionModel()
    
    @State var movieDescriptionArray = [MovieDescriptionModel]()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    //MARK: - HEADER -
                    MovieHeaderView(items: $movieHeaderItems)
                     
                    //MARK: - CENTER -
                    
                    MovieDescriptionView(item: $movieDescriptionItem)
                        .padding(.horizontal, 24)
                    
                    Divider()
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)
                    
                    //MARK: - FOOTER -
                    
                    VStack {
                        Text("Popular")
                            .font(Font.system(size: 22))
                            .fontWeight(.bold)
                    } //: VSTACK
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 10)
                    
                    ForEach(1...7, id: \.self) { _ in
                        NavigationLink(destination: MovieDetailView(), isActive: $isActive) {
                            PopularCardView()
                                .padding(.vertical, 10)
                        } //: LINK
                    }
                    
                } //: SCROLL
                .navigationBarTitle("Movies", displayMode: .large)
                .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
            } //: ZStack
            .navigationViewStyle(.stack)
        } //: NAVIGATION
        .onAppear {
            fetchTopRatedMovies()
        }
    }
    
    private func fetchTopRatedMovies() {
        movieViewModel.fetchMovieTopRated { result, success in
            guard let response = result else { return }
            (success) ? handleMovieHeaderResponse(with: response): print("Empty Response!!!")
        }
    }
    
    private func handleMovieHeaderResponse(with results: [MovieTopRatedResult]) {
        for result in results {
            let item = MovieDescriptionModel(rating: "\(result.vote_average ?? 0.0)",
                                             movieTitle: result.original_title ?? "-",
                                             movieGenre: getGenres(genreIds: result.genre_ids ?? [0], type: .movie))
            movieDescriptionArray.append(item)
        }
    }
    
    func getGenres(genreIds: [Int], type: ContentType) -> String {
        var genreIndexs = [GenreResult]()
        
        switch type {
        case .movie:
            for genreId in genreIds {
                genreIndexs.append(GenreModel.movieInstance.first(where: {$0.id == genreId})!)
            }
        case .tvSerie:
            for genreId in genreIds {
                genreIndexs.append(GenreModel.tvInstance.first(where: {$0.id == genreId})!)
            }
        }
        
        return convertGenresToString(genreIndexs)
    }
    
    func convertGenresToString(_ genres: [GenreResult]) -> String {
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

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .previewDisplayName("iPhone 12 Mini")
            .preferredColorScheme(.light)
    }
}

struct MovieDescriptionModel {
    var rating: String = ""
    var movieTitle: String = ""
    var movieGenre: String = ""
}
