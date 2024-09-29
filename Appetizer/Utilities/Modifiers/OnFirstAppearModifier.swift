//
//  OnFirstAppearModifier.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 30/09/2024.
//

import SwiftUI

struct OnFirstAppearModifier: ViewModifier {
    let onFirstAppearAction: () -> Void
    @State private var hasAppeared = false
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                guard !hasAppeared else { return }
                hasAppeared = true
                onFirstAppearAction()
            }
    }
}
