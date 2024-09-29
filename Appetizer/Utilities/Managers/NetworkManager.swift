//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 24/09/2024.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private static let appetizersEndpoint = baseURL + "appetizers"
    private let cache = NSCache<NSString, UIImage>()
    
//    func getAppetizers(completion: @escaping (Result<[Appetizer], APError>) -> Void) {
//        guard let url = URL(string: NetworkManager.appetizersEndpoint) else {
//            completion(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            if let _ = error {
//                completion(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data else {
//                completion(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let response = try JSONDecoder().decode(AppetizerList.self, from: data)
//                completion(.success(response.request))
//            } catch {
//                completion(.failure(.invalidData))
//            }
//        }
//        
//        task.resume()
//    }
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: NetworkManager.appetizersEndpoint) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let appetizers = try JSONDecoder().decode(AppetizerList.self, from: data)
            debugPrint(appetizers)
            return appetizers.request
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        
        task.resume()
    }
}
