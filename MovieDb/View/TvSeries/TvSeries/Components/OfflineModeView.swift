//
//  OfflineModeView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.12.2024.
//

import SwiftUI

struct OfflineModeView: View {
    
    let onRetry: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.1))
                    .frame(width: 120, height: 120)
                
                Image(systemName: "wifi.slash")
                    .font(.system(size: 50))
                    .foregroundColor(.red)
            }
            
            VStack(spacing: 12) {
                Text("No Internet Connection")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Please check your connection and try again")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }
            
            VStack(spacing: 12) {
                Button(action: onRetry) {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.clockwise")
                        Text("Try Again")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color("VibrantBlue"))
                    .cornerRadius(12)
                }
                .padding(.horizontal, 40)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Troubleshooting tips:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    TipRow(icon: "wifi", text: "Check your WiFi or mobile data")
                    TipRow(icon: "airplane", text: "Turn off Airplane Mode")
                    TipRow(icon: "arrow.clockwise", text: "Restart your device")
                }
                .padding(.horizontal, 40)
                .padding(.top, 8)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 60)
    }
}

struct TipRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(width: 16)
            
            Text(text)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

// MARK: - Preview

#Preview {
    OfflineModeView(onRetry: {})
}
