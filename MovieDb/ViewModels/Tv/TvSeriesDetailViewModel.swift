//
//  TvSeriesDetailViewModel.swift
//  MovieDB-week1
//
//  Created by Metin Yıldız on 27.12.2021.
//

import Foundation

class TvSeriesDetailViewModel: BaseViewModel {
    
    @Published var castPeople: CastPeopleModel = CastPeopleModel()
    @Published var isActive = false
    
    var networkClient: MovieDbNetworkProvider = MovieDbNetworkClient()
    
    func getPerson(id: Int) {
        networkClient
            .getPerson(id: id)
            .replaceError(with: CastPeopleModel())
            .assign(to: &$castPeople)
        isActive = true
    }
}
