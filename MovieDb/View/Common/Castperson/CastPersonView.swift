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
    @State private var castPeople: CastPeopleModel?
    
    var id: Int
    
    var body: some View {
        ScrollView {
            if let castPeople = castPeople {
                VStack {
                    CastPersonHeaderView(castPeople: castPeople) {
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    CastPersonCenterView(castPeople: castPeople)
                    
                    CastPersonFooterView(castPeople: castPeople)
                }
            }
        }
        .background(Color("BackgroundColor"))
        .navigationBarHidden(true)
        .onFirstAppear {
            Task {
                await viewModel.getPerson(id: id) { model in
                    castPeople = model
                }
            }
        }
    }
}

#Preview {
    CastPersonView(id: -1)
}
