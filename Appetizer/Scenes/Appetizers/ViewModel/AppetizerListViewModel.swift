//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 24/09/2024.
//

import SwiftUI

@MainActor
final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers = [Appetizer]()
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
}
