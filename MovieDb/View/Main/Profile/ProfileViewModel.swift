//
//  ProfileViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.01.2026.
//

import SwiftUI

class ProfileViewModel: BaseViewModel {
    @AppStorage("isLogin") var isLogin: Bool = false
    @Published var profileState: ViewState = .loaded

    enum ViewState {
        case idle
        case loading
        case loaded
    }
}
 
