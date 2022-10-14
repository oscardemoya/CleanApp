//
//  FetchPostDetailsUseCase.swift
//  Domain
//
//  Created by Oscar De Moya on 5/10/22.
//

import Foundation

protocol FetchPostDetailsUseCaseProtocol {
    associatedtype RequestValue
    associatedtype ResponseValue
    func execute(requestValue: RequestValue) async throws -> ResponseValue
}

public final class FetchPostDetailsUseCase: FetchPostDetailsUseCaseProtocol {
    var repository: PostsRepositoryProtocol
    
    public init(repository: PostsRepositoryProtocol) {
        self.repository = repository
    }
        
    public func execute(requestValue: RequestValue) async throws -> ResponseValue {
        let post = try await repository.fetchPost(id: requestValue.id)
        return ResponseValue(post: post)
    }
}
