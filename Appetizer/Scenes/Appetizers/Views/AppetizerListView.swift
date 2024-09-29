//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 23/09/2024.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject private var appetizerListViewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(appetizerListViewModel.appetizers) { appetizer in
                    AppetizerView(appetizer: appetizer)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .contentShape(.rect)
                        .onTapGesture {
                            appetizerListViewModel.selectedAppetizer = appetizer
                            appetizerListViewModel.isShowingDetail = true
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Appetizers")
                .disabled(appetizerListViewModel.isShowingDetail)
            }
            .onFirstAppear {
                appetizerListViewModel.getAppetizers()
            }
            .blur(radius: appetizerListViewModel.isShowingDetail ? 20 : 0)
            
            if appetizerListViewModel.isShowingDetail {
                if let selectedAppetizer = appetizerListViewModel.selectedAppetizer {
                    AppetizerDetailView(appetizer: selectedAppetizer, isShowingDetail: $appetizerListViewModel.isShowingDetail)
                }
            }
            
            if appetizerListViewModel.isLoading {
                LoadingView()
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
