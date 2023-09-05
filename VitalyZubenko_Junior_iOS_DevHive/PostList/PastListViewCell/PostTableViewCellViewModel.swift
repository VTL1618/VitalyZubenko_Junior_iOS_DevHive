//
//  PostTableViewCellViewModel.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 05.09.2023.
//

import Foundation

protocol PostTableViewCellViewModelProtocol {
    var postTitle: String { get }
    var postBody: String { get }
    init(post: Post)
}

class PostTableViewCellViewModel: PostTableViewCellViewModelProtocol {
    
    var postTitle: String {
        post.name
    }
    
    var postBody: String {
        post.body
    }
    
    private let post: Post
    
    required init(post: Post) {
        self.post = post
    }
}
