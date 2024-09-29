//
//  PlaceholderImageModifier.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 29/09/2024.
//

import SwiftUI

struct AppetizerListImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 120, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
