//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 26/09/2024.
//

import SwiftUI
import NukeUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order: Order
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .frame(maxWidth: .infinity)
//                .frame(height: 220)
            
            LazyImage(url: URL(string: appetizer.imageURL)) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                } else {
                    Image(.foodPlaceholder)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                }
            }
            
            appetizerInformation
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
            }
            .padding(.top, 30)
            .padding(.bottom, 30)
        }
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetail = false
            } label: {
                DismissButton()
            }
        }
        .modifier(AppetizerDetailCardModifier())
    }
    
    var appetizerInformation: some View {
        VStack(spacing: 0) {
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .lineLimit(2, reservesSpace: true)
                .font(.body)
                .padding([.horizontal, .vertical], 16)
            
            HStack(spacing: 40) {
                AppetizerNutritionView(title: "Calories", value: "\(appetizer.calories)")
                
                AppetizerNutritionView(title: "Carbs", value: "\(appetizer.carbs) g")
                
                AppetizerNutritionView(title: "Protein", value: "\(appetizer.protein) g")
            }
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: AppetizerList.mockAppetizerList[0], isShowingDetail: .constant(true))
}
