//
//  PostsRepository.swift
//  Domain
//
//  Created by Oscar De Moya on 5/10/22.
//

import Foundation

protocol PostsRepository {
    func fetchPosts(from page: PaginationParameters?) async throws -> [Post]
}
