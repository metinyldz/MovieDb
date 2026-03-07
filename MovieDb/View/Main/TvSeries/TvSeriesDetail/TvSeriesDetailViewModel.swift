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
    
    var networkManager = NetworkManager()
    
    func getPerson(id: Int, completion: @escaping (CastPeopleModel?) -> Void) async {
        do {
            castPeople = try await networkManager.fetch(url: MovieDbRouter.getPerson(id: id).urlString, expecting: CastPeopleModel.self)
            isActive = true
            completion(castPeople)
        } catch {
            print(error)
        }
    }
}
