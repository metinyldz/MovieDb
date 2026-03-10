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
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    // MARK: - HEADER
                    if let posterPath = viewModel.castPeople.profile_path {
                        ParallaxHeaderView(
                            posterPath: posterPath,
                            width: geometry.size.width,
                            height: geometry.size.height / 2.2
                        )
                        .padding(.bottom, 10)
                    }
                    
                    // MARK: - CENTER
                    if let name = viewModel.castPeople.name,
                       let biography = viewModel.castPeople.biography {
                        CastPersonCenterView(
                            name: name,
                            biography: biography
                        )
                    }
                    
                    // MARK: - FOOTER
                    if let placeOfBirth = viewModel.castPeople.place_of_birth {
                        CastPersonFooterView(placeOfBirth: placeOfBirth)
                    }
                }
            }
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
        }
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
