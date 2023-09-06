//
//  PostListViewModel.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 05.09.2023.
//

import Foundation

protocol PostListViewModelProtocol: AnyObject {
    var posts: [Post] { get }
    func fetchPosts(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> PostTableViewCellViewModelProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> Post
}

class PostListViewModel: PostListViewModelProtocol {
    
    var posts: [Post] = []
    
    func fetchPosts(completion: @escaping() -> Void) {
        NetworkManager.shared.fetchData { [unowned self] posts in
            for post in posts where post.userId == 1 {
                self.posts.append(post)
            }
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        posts.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> PostTableViewCellViewModelProtocol {
        let post = posts[indexPath.row]
        return PostTableViewCellViewModel(post: post)
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> Post {
        let post = posts[indexPath.row]
        return post
    }
}
