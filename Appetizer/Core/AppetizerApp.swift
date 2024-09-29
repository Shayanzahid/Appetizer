//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 23/09/2024.
//

import SwiftUI

@main
struct AppetizerApp: App {
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(Order())
        }
    }
}
