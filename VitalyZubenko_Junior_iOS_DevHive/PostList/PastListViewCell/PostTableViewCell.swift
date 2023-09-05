//
//  PostTableViewCell.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 05.09.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var viewModel: PostTableViewCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel
        }
        // Computed property must have accessors specified
    }
}
