//
//  CommentsViewModel.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 05.09.2023.
//

import Foundation

protocol CommentsViewModelProtocol: AnyObject {
    var comments: [Comment] { get }
    func fetchComments(forPostId id: Int, completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CommentTableViewCellViewModelProtocol
}

class CommentsViewModel: CommentsViewModelProtocol {
    
    var comments: [Comment] = []
    
    func fetchComments(forPostId id: Int, completion: @escaping () -> Void) {
        NetworkManager.shared.fetchComments { [unowned self] comments in
            for comment in comments where comment.postId == id {
                self.comments.append(comment)
            }
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        comments.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CommentTableViewCellViewModelProtocol {
        let comment = comments[indexPath.row]
        return CommentTableViewCellViewModel(comment: comment)
    }
}
