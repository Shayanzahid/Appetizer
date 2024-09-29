//
//  ImageExtension.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 29/09/2024.
//

import SwiftUI
import NukeUI

extension LazyImage {
    func listImageStyle() -> some View {
        self.modifier(AppetizerListImageModifier())
    }
}
