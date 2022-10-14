//
//  PostsRepositoryMock.swift
//  Domain
//
//  Created by Oscar De Moya on 6/10/22.
//

import Foundation

enum PostsRepositoryMockError: Error {
    case failedFetching
    case notFound
}

final class PostsRepositorySuccessMock: PostsRepositoryProtocol {
    func fetchPosts(from page: any Page) async throws -> [Post] {
        [Post.stub()]
    }
    
    func fetchPost(id: any Hashable) async throws -> Post {
        Post.stub()
    }
}

final class PostsRepositoryFailureMock: PostsRepositoryProtocol {
    func fetchPosts(from page: any Page) async throws -> [Post] {
        throw PostsRepositoryMockError.failedFetching
    }
    
    func fetchPost(id: any Hashable) async throws -> Post {
        throw PostsRepositoryMockError.failedFetching
    }
}

final class PostsRepositoryEmptyMock: PostsRepositoryProtocol {
    func fetchPosts(from page: any Page) async throws -> [Post] {
        []
    }
    
    func fetchPost(id: any Hashable) async throws -> Post {
        throw PostsRepositoryMockError.notFound
    }
}
