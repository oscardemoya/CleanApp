//
//  FetchPostsValues.swift
//  Domain
//
//  Created by Oscar De Moya on 5/10/22.
//

import Foundation

extension FetchPostsUseCase {
    struct RequestValue {
        var page: PaginationParameters
    }
    
    struct ResponseValue: Codable {
        var posts: [Post]
    }
}
