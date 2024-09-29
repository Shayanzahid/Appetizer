//
//  RemoteImage.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 26/09/2024.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image?
    
    func load(from urlString: String) {
        NetworkManager.shared.downloadImage(from: urlString) { [weak self] uiImage in
            guard let self, let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(.foodPlaceholder).resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject private var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(from: urlString)
            }
    }
}
