//
//  ProfileContentView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.01.2026.
//

import SwiftUI

struct ProfileContentView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        switch viewModel.profileState {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView().tint(Color("VibrantBlue"))
        case .loaded:
            ScrollView(showsIndicators: false) {
                //MARK: - HEADER -
                ProfileViewHeader()
                
                ProfileViewList()
            }
        }
    }
}

#Preview {
    ProfileContentView(viewModel: ProfileViewModel())
}
