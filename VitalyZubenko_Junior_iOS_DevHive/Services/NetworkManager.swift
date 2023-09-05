//
//  NetworkManager.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 05.09.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private let api = "https://jsonplaceholder.typicode.com/posts"
    
    private init() {
        
    }
    
    func fetchData(completion: @escaping (_ posts: [Post]) -> Void) {
        
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Description for ERROR")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([Post].self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
            } catch let error {
                print("Error serialization JSON", error)
            }
        }.resume()
    }
}
