//
//  View+Extension.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.12.2025.
//

import SwiftUI

extension View {
    /// Adds an action to perform only when this view appears for the first time.
    ///
    /// Use this modifier when you need to perform an action only once when a view initially appears,
    /// such as loading data from a network, initializing state, or triggering one-time setup operations.
    /// Unlike `onAppear`, which runs every time a view appears (including when navigating back),
    /// `onFirstAppear` ensures the action runs only on the initial appearance.
    ///
    /// - Parameter action: The action to perform when the view appears for the first time.
    ///
    /// ## Example
    ///
    /// ```swift
    /// struct MovieListView: View {
    ///     @StateObject private var viewModel = MovieViewModel()
    ///
    ///     var body: some View {
    ///         List(viewModel.movies) { movie in
    ///             MovieRow(movie: movie)
    ///         }
    ///         .onFirstAppear {
    ///             viewModel.loadMovies()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ## Use Cases
    ///
    /// - Loading initial data from an API
    /// - Setting up analytics or tracking
    /// - Performing one-time view setup
    /// - Initializing resources that shouldn't be recreated
    ///
    /// - Note: The action closure is marked as `@escaping` because it may be called
    ///   after the function returns, when the view actually appears.
    ///
    /// - Returns: A view that triggers the action only on its first appearance.
    func onFirstAppear(perform action: @escaping () -> Void) -> some View {
        self.modifier(FirstAppearModifier(action: action))
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
