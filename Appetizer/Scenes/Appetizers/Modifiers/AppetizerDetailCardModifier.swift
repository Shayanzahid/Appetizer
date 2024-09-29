//
//  AppetizerDetailCardModifier.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 26/09/2024.
//

import SwiftUI

struct AppetizerDetailCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
            .clipShape(.rect(cornerRadius: 12))
            .padding(.horizontal, 40)
            .padding(.vertical, 100)
            .shadow(radius: 40)
    }
}
