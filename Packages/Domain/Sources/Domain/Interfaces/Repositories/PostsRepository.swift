//
//  PostsRepository.swift
//  Domain
//
//  Created by Oscar De Moya on 5/10/22.
//

import Foundation

public protocol PostsRepositoryProtocol {
    func fetchPosts(from page: Page) async throws -> [Post]
}
