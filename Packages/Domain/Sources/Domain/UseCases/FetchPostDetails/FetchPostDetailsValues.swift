//
//  FetchPostDetailsValues.swift
//  Domain
//
//  Created by Oscar De Moya on 5/10/22.
//

import Foundation

public extension FetchPostDetailsUseCase {
    struct RequestValue {
        public var id: any Hashable
        
        public init(id: any Hashable) {
            self.id = id
        }
    }
    
    struct ResponseValue: Codable {
        public var post: Post
        
        public init(post: Post) {
            self.post = post
        }
    }
}
