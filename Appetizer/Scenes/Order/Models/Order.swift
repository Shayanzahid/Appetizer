//
//  Order.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 28/09/2024.
//

import SwiftUI

final class Order: ObservableObject {
    @Published private var items: [Appetizer] = []
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func getItems() -> [Appetizer] {
        return items
    }
}
