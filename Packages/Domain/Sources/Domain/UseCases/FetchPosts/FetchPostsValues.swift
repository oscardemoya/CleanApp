//
//  FetchPostsValues.swift
//  Domain
//
//  Created by Oscar De Moya on 5/10/22.
//

import Foundation

public extension FetchPostsUseCase {
    struct RequestValue {
        public var page: any Page
        
        public init(page: any Page) {
            self.page = page
        }
    }
    
    struct ResponseValue: Codable {
        public var posts: [Post]
        
        public init(posts: [Post]) {
            self.posts = posts
        }
    }
}
