//
//  PostsListViewModel.swift
//  
//
//  Created by Oscar De Moya on 10/10/22.
//

import Domain

@MainActor
public class PostsListViewModel {
    
    public var postsListUseCase: FetchPostsUseCase
    
    public init(postsListUseCase: FetchPostsUseCase) {
        self.postsListUseCase = postsListUseCase
    }
    
    func fetchPosts(page: any Page) async throws -> [PostsListCell.Model] {
        let requestValue = FetchPostsUseCase.RequestValue(page: page)
        let response = try await postsListUseCase.execute(requestValue: requestValue)
        return response.posts.map(PostsListCell.Model.init)
    }
    
}
