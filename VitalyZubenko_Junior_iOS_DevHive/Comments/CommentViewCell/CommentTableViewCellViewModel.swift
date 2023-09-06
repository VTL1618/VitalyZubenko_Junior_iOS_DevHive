//
//  CommentsTableViewCellViewModel.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 06.09.2023.
//

import Foundation

protocol CommentTableViewCellViewModelProtocol {
    var commentTitle: String { get }
    var commentBody: String { get }
    init(comment: Comment)
}

class CommentTableViewCellViewModel: CommentTableViewCellViewModelProtocol {
    
    var commentTitle: String {
        comment.email
    }
    
    var commentBody: String {
        comment.body
    }
    
    private let comment: Comment
    
    required init(comment: Comment) {
        self.comment = comment
    }
}
