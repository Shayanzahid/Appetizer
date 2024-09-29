//
//  OrderView.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 23/09/2024.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.getItems()) { order in
                            AppetizerView(appetizer: order)
                        }
                        .onDelete(perform: order.removeItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        debugPrint("Order placed")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                            .padding(.vertical, 16)
                    }
                }
                
                if order.getItems().isEmpty {
                    EmptyState(image: .emptyOrder, message: "You have no orders currently. \nPlease place an order.")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    OrderView()
}
