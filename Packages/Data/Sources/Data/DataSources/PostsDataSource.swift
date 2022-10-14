//
//  PostsDataSource.swift
//  
//
//  Created by Oscar De Moya on 12/10/22.
//

import Foundation
import Domain

public protocol PostsDataSource {
    func fetchPosts(page: any Page) async throws -> [Post]
    func fetchPost(id: any Hashable) async throws -> Post
}
