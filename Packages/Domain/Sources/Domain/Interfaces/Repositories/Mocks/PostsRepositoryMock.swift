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

final class PostsRepositorySuccessMock: PostsRepository {
    func fetchPosts(from page: PaginationParameters?) async throws -> [Post] {
        [Post.stub()]
    }
}

final class PostsRepositoryFailureMock: PostsRepository {
    func fetchPosts(from page: PaginationParameters?) async throws -> [Post] {
        throw PostsRepositoryMockError.failedFetching
    }
}

final class PostsRepositoryEmptyMock: PostsRepository {
    func fetchPosts(from page: PaginationParameters?) async throws -> [Post] {
        []
    }
}
