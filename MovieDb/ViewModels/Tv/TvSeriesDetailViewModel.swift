//
//  TvSeriesDetailViewModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 27.12.2021.
//

import Foundation

@MainActor
class TvSeriesDetailViewModel: BaseViewModel {
    
    @Published var castPeople: CastPeopleModel = CastPeopleModel()
    @Published var isActive = false
    
    var movieDbNetworkClient: MovieDbNetworkProvider = MovieDbNetworkClient()
    
    func getPerson(id: Int) {
        movieDbNetworkClient
            .getPerson(id: id)
            .replaceError(with: CastPeopleModel())
            .assign(to: &$castPeople)
        isActive = true
    }
}
