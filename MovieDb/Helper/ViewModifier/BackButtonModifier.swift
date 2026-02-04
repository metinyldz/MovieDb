//
//  BackButtonModifier.swift
//  MovieDb
//
//  Created by Metin Yıldız on 4.02.2026.
//

import SwiftUI

/// A ViewModifier that adds a header overlay (overlay) with a back arrow (arrow.left).
/// When the arrow is tapped, the current view is dismissed via `presentationMode`.
struct BackButtonModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.white)
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding(32)
                , alignment: .topLeading
            )
    }
}

extension View {
    /// Adds a header overlay with a back arrow positioned at the top-leading corner.
    /// - Returns: A view with the back-button header overlay applied.
    func backButton() -> some View {
        modifier(BackButtonModifier())
    }
}
