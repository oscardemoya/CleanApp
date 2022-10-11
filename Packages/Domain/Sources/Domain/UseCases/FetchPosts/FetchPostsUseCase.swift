//
//  FetchPostsUseCase.swift
//  Domain
//
//  Created by Oscar De Moya on 5/10/22.
//

import Foundation

protocol FetchPostsUseCaseProtocol {
    associatedtype RequestValue
    associatedtype ResponseValue
    func execute(requestValue: RequestValue) async throws -> ResponseValue
}

public final class FetchPostsUseCase: FetchPostsUseCaseProtocol {
    var repository: PostsRepositoryProtocol
    
    public init(repository: PostsRepositoryProtocol) {
        self.repository = repository
    }
        
    public func execute(requestValue: RequestValue) async throws -> ResponseValue {
        let posts = try await repository.fetchPosts(from: requestValue.page)
        return ResponseValue(posts: posts)
    }
}
