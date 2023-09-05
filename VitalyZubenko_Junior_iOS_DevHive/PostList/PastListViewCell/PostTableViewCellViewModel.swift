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
