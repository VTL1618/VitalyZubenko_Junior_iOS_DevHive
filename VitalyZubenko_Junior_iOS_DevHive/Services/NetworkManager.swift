//
//  NetworkManager.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 05.09.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private let apiPosts = "https://jsonplaceholder.typicode.com/posts"
    private let apiComments = "https://jsonplaceholder.typicode.com/comments"

    private init() {
        
    }
    
    func fetchData(completion: @escaping (_ posts: [Post]) -> Void) {
        
        guard let url = URL(string: apiPosts) else { return }
        
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
    
    func fetchComments(completion: @escaping (_ comments: [Comment]) -> Void) {
        
        guard let url = URL(string: apiComments) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Description for ERROR")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let comments = try decoder.decode([Comment].self, from: data)
                DispatchQueue.main.async {
                    completion(comments)
                }
            } catch let error {
                print("Error serialization JSON", error)
            }
        }.resume()
    }
}
