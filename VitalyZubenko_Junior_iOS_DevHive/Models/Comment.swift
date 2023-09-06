//
//  Comment.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 05.09.2023.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let email: String
    let body: String
}
