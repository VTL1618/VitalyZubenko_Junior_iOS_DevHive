//
//  CommentsTableViewCell.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 06.09.2023.
//

import Foundation
import UIKit

class CommentTableViewCell: UITableViewCell {
    
    static let reuseId = "commentCell"
    
    var viewModel: CommentTableViewCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.commentTitle
            content.secondaryText = viewModel.commentBody
            contentConfiguration = content
        }
    }
}
