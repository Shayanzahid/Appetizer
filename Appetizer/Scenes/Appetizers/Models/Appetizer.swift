//
//  Appetizer.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 23/09/2024.
//

import Foundation

struct AppetizerList: Decodable {
    let request: [Appetizer]
}

extension AppetizerList {
    static let mockAppetizerList: [Appetizer] = [
        .init(id: 1, name: "Appetizer 1", description: "This is the test description for Appetizer 1", imageURL: "asian-flank-steak", price: 10, carbs: 10, protein: 10, calories: 10),
        .init(id: 2, name: "Appetizer 2", description: "This is the test description for Appetizer 2", imageURL: "chicken-avocado-spring-roll", price: 20, carbs: 20, protein: 20, calories: 20),
        .init(id: 3, name: "Appetizer 3", description: "This is the test description for Appetizer 3", imageURL: "chicken-dumplings", price: 30, carbs: 30, protein: 30, calories: 30),
        .init(id: 4, name: "Appetizer 4", description: "This is the test description for Appetizer 4", imageURL: "buffalo-chicken-bites", price: 40, carbs: 40, protein: 40, calories: 40),
        .init(id: 5, name: "Appetizer 5", description: "This is the test description for Appetizer 5", imageURL: "blackened-shrimp", price: 50, carbs: 50, protein: 50, calories: 50)
    ]
}

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let price: Double
    let carbs: Int
    let protein: Int
    let calories: Int
}
