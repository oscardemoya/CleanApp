//
//  PostDetailsViewModel.swift
//  
//
//  Created by Oscar De Moya on 13/10/22.
//

import Domain

@MainActor
public class PostDetailsViewModel {
    
    public var postDetailsUseCase: FetchPostDetailsUseCase
    
    public init(postDetailsUseCase: FetchPostDetailsUseCase) {
        self.postDetailsUseCase = postDetailsUseCase
    }
    
    func fetchPost(id: any Hashable) async throws -> Post {
        let requestValue = FetchPostDetailsUseCase.RequestValue(id: id)
        let response = try await postDetailsUseCase.execute(requestValue: requestValue)
        return response.post
    }
    
}
