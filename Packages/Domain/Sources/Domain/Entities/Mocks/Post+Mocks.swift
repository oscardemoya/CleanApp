//
//  PostMocks.swift
//  Domain
//
//  Created by Oscar De Moya on 6/10/22.
//

import Foundation

extension Post {
    static func stub(id: Post.Identifier = 1,
                     userId: Int = 1,
                     title: String = "title1",
                     body: String = "body1") -> Self {
        Post(id: id,
             userId: userId,
             title: title,
             body: body)
    }
}
