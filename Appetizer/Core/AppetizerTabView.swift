//
//  AppetizerTabView.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 23/09/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.getItems().count)
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
