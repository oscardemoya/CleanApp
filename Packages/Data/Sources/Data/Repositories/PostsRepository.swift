//
//  PostsRepository.swift
//  
//
//  Created by Oscar De Moya on 9/10/22.
//

import Foundation
import Domain
import Networking

public final class PostsRepository {
    private let dataSource: PostsDataSource
    
    public init(dataSource: PostsDataSource) {
        self.dataSource = dataSource
    }
}
    
extension PostsRepository: PostsRepositoryProtocol {
    public func fetchPosts(from page: any Page) async throws -> [Post] {
        try await dataSource.fetchPosts(page: page)
    }
    
    public func fetchPost(id: any Hashable) async throws -> Post {
        try await dataSource.fetchPost(id: id)
    }
}
