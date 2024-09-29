//
//  ViewExtension.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 30/09/2024.
//

import SwiftUI

extension View {
    func onFirstAppear(_ action: @escaping () -> Void) -> some View {
        self.modifier(OnFirstAppearModifier(onFirstAppearAction: action))
    }
}
