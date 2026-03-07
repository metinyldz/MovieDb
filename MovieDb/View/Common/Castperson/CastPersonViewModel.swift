//
//  CastPersonViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 7.03.2026.
//

import Foundation

class CastPersonViewModel: BaseViewModel {
    @Published var castPeople: CastPeopleModel = CastPeopleModel()
    
    var networkManager = NetworkManager()
    
    func getPerson(id: Int) async {
        do {
            castPeople = try await networkManager.fetch(url: MovieDbRouter.getPerson(id: id).urlString, expecting: CastPeopleModel.self)
        } catch {
            print(error)
        }
    }
    
    enum ViewState {
        case idle
        case loading
        case loaded
        case failed
    }
}
