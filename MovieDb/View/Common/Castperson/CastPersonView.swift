//
//  CastPersonView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 19.06.2022.
//

import SwiftUI

struct CastPersonView: View {
    @StateObject private var viewModel = CastPersonViewModel()
    
    var id: Int
    
    var body: some View {
        VStack {
            if let posterPath = viewModel.castPeople.profile_path {
                CastPersonHeaderView(posterPath: posterPath)
            }
            if let name = viewModel.castPeople.name,
               let biography = viewModel.castPeople.biography {
                CastPersonCenterView(
                    name: name,
                    biography: biography
                )
            }
            if let placeOfBirth = viewModel.castPeople.place_of_birth {
                CastPersonFooterView(placeOfBirth: placeOfBirth)
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        .backButton()
        .onFirstAppear {
            Task {
                await viewModel.getPerson(id: id)
            }
        }
    }
}

#Preview {
    CastPersonView(id: -1)
}
