//
//  EmptyState.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 28/09/2024.
//

import SwiftUI

struct EmptyState: View {
    let image: ImageResource
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState(image: .emptyOrder, message: "This is our test message.\nI'm making it a little long")
}
