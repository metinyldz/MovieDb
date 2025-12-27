//
//  FirstAppearModifier.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.12.2025.
//

import SwiftUI

/// A view modifier that executes an action only on the first appearance of a view.
///
/// This modifier tracks whether a view has appeared using a `@State` property and ensures
/// the provided action is executed only once, even if the view appears multiple times
/// during its lifecycle (such as when navigating back and forth in a navigation stack).
///
/// ## Implementation Details
///
/// The modifier uses a private `@State` boolean flag (`hasAppeared`) to track the view's
/// appearance state. When the view appears, it checks this flag and only executes the
/// action if the flag is `false`, then sets it to `true` to prevent subsequent executions.
///
/// ## Usage
///
/// Don't instantiate this modifier directly. Instead, use the `onFirstAppear(perform:)`
/// method on any SwiftUI view:
///
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         Text("Hello, World!")
///             .onFirstAppear {
///                 print("This prints only once")
///             }
///     }
/// }
/// ```
///
/// - SeeAlso: `View.onFirstAppear(perform:)`
struct FirstAppearModifier: ViewModifier {
    /// The action to perform when the view appears for the first time.
    let action: () -> Void
    
    /// A flag indicating whether the view has already appeared.
    @State private var hasAppeared = false
    
    /// Creates the modified view by adding first-appearance tracking behavior.
    ///
    /// - Parameter content: The view content to which the modifier is applied.
    /// - Returns: A view that executes the action only on its first appearance.
    func body(content: Content) -> some View {
        content.onAppear {
            guard !hasAppeared else { return }
            hasAppeared = true
            action()
        }
    }
}
