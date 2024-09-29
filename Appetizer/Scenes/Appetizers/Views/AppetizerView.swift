//
//  AppetizerView.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 23/09/2024.
//

import SwiftUI
import NukeUI

struct AppetizerView: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 16) {
            LazyImage(url: URL(string: appetizer.imageURL)) { state in
                if let image = state.image {
                    image
                        .resizable()
                } else {
                    Image(.foodPlaceholder)
                        .resizable()
                }
            }
            .listImageStyle()
            
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .scaledToFit()
//                .frame(width: 120, height: 90)
//                .clipShape(RoundedRectangle(cornerRadius: 8))
            
//            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//                image
//                    .resizable()
//            } placeholder: {
//                Image(.foodPlaceholder)
//                    .resizable()
//            }
//            .listImageStyle()
            
            VStack(alignment: .leading) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    AppetizerView(appetizer: AppetizerList.mockAppetizerList[0])
}
