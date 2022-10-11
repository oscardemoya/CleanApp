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
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}
    
extension PostsRepository: PostsRepositoryProtocol {
    public func fetchPosts(from page: Page) async throws -> [Post] {
        return try await apiClient.get("/posts").value
    }
}
