//
//  LoginViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 15.04.2023.
//

import Foundation

@MainActor
class LoginViewModel: BaseViewModel {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var showAlert: Bool = false
    @Published var loginState: ViewState = .idle

    override init() {
        super.init()
        Task { @MainActor in
            loginState = .loaded
        }
    }
    
    enum ViewState {
        case idle
        case loading
        case loaded
    }
}
