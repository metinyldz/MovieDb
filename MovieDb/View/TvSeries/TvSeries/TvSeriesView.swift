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
    
    // MARK: - Constants
    
    private enum Constants {
        static let horizontalPadding: CGFloat = 24
        static let dividerVerticalPadding: CGFloat = 20
        static let cardBottomPadding: CGFloat = 10
        static let sectionTitleFontSize: CGFloat = 22
        static let shadowRadius: CGFloat = 8
        static let shadowOffset: CGFloat = 2
        static let shadowOpacity: CGFloat = 0.15
    }
    
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
