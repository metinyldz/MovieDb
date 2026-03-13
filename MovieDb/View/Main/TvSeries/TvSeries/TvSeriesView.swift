//
//  TvSeriesView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 5.05.2022.
//

import SwiftUI

struct TvSeriesView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = TvSeriesViewModel()
    
    // MARK: - Body
    
    var body: some View {
        MainBackgroundContainer {
            TVSeriesContentView(viewModel: viewModel) {
                loadData()
            }
        }
        .navigationBarTitle("TV Series", displayMode: .large)
        .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
        .onFirstAppear {
            loadData()
        }
    }
    
    // MARK: - Methods
    
    private func loadData() {
        Task {
            await viewModel.loadAllData()
        }
    }
}

// MARK: - Preview

#Preview {
    TvSeriesView()
        .environmentObject(ContentBindigs())
        .preferredColorScheme(.light)
}
