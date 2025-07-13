//
//  AuthRepository.swift
//  Domain
//
//  Created by Oscar De Moya on 9/25/24.
//

import Foundation

public protocol AuthRepository {
    func login(credentials: LoginCredentials) async throws -> AuthToken
}
