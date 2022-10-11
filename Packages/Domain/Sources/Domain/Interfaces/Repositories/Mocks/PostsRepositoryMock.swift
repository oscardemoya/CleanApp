//
//  PostsRepositoryMock.swift
//  Domain
//
//  Created by Oscar De Moya on 6/10/22.
//

import Foundation

enum PostsRepositoryMockError: Error {
    case failedFetching
}

final class PostsRepositorySuccessMock: PostsRepositoryProtocol {
    func fetchPosts(from page: Page) async throws -> [Post] {
        [Post.stub()]
    }
}

final class PostsRepositoryFailureMock: PostsRepositoryProtocol {
    func fetchPosts(from page: Page) async throws -> [Post] {
        throw PostsRepositoryMockError.failedFetching
    }
}

final class PostsRepositoryEmptyMock: PostsRepositoryProtocol {
    func fetchPosts(from page: Page) async throws -> [Post] {
        []
    }
}
