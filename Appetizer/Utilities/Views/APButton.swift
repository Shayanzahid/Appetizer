//
//  APButton.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 26/09/2024.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.brandPrimary)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal, 16)
    }
}

#Preview {
    APButton(title: "APButton")
}
