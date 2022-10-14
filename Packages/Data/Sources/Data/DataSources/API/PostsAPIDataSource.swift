//
//  File.swift
//  
//
//  Created by Oscar De Moya on 12/10/22.
//

import Foundation
import Domain
import Networking

public struct PostsAPIDataSource: PostsDataSource {
    let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    public func fetchPosts(page: any Page) async throws -> [Post] {
        let queryItems: [URLQueryItem] = ["_start": "\(page.offset)", "_limit": "\(page.limit)"]
        let posts: [PostAPIEntity] = try await apiClient.get("/posts", queryItems: queryItems).value
        return posts.map { Post(post: $0) }
    }
    
    public func fetchPost(id: any Hashable) async throws -> Post {
        let post: PostAPIEntity = try await apiClient.get("/posts/\(id)").value
        return Post(post: post)
    }
}
