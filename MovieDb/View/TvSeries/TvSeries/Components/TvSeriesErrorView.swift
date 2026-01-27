//
//  TvSeriesErrorView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.01.2026.
//

import SwiftUI

struct TvSeriesErrorView: View {
    
    
    private enum Constants {
        static let horizontalPadding: CGFloat = 24
    }
    
    var error: Error
    @Binding var retryCount: Int
    var completion: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text("Oops! Something went wrong")
                .font(.title2)
                .fontWeight(.bold)
            
            Text(error.localizedDescription)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Constants.horizontalPadding)
            
            Button(action: {
                AnalyticsManager.log(event: .userAction(
                    "ErrorRetryButtonTapped",
                    parameters: [
                        "screen": "TVSeries",
                        "errorType": String(describing: type(of: error)),
                        "retryCount": retryCount
                    ]
                ))
                completion()
            }) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Try Again")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color("VibrantBlue"))
                .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 100)
    }
}
