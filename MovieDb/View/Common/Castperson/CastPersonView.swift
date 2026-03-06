//
//  CastPersonView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 19.06.2022.
//

import SwiftUI

struct CastPersonView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = TvSeriesDetailViewModel()
    
    var id: Int
    
    var body: some View {
        VStack {
            CastPersonHeaderView(castPeople: viewModel.castPeople)
                .background(Color.red)
            CastPersonCenterView(castPeople: viewModel.castPeople)
                .background(Color.green)
            CastPersonFooterView(castPeople: viewModel.castPeople)
                .background(Color.blue)
            
            Spacer()
        }
    }
}

#Preview {
    CastPersonView(id: -1)
}
