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
    func viewModelForSelectedRow(at indexPath: IndexPath) -> CommentsViewModelProtocol
}

class PostListViewModel: PostListViewModelProtocol {
    
    var posts: [Post] = []
    
    func fetchPosts(completion: @escaping() -> Void) {
        
    }
    
    func cellViewModel(at indexPath: IndexPath) -> PostTableViewCellViewModelProtocol {
        <#code#>
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> <<error type>> {
        <#code#>
    }
}
