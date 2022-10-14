//
//  PostAPIEntity.swift
//  
//
//  Created by Oscar De Moya on 10/10/22.
//

import Foundation
import Domain

struct PostAPIEntity: Decodable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}

extension Post {
    init(post: PostAPIEntity) {
        self.init(id: post.id,
                  userId: post.userId,
                  title: post.title,
                  body: post.body)
    }
}
