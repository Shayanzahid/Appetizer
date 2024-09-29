//
//  AppetizerNutritionView.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 26/09/2024.
//

import SwiftUI

struct AppetizerNutritionView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerNutritionView(title: "Calories", value: "10")
}
