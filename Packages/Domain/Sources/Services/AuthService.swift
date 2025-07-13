//
//  AuthService.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/8.
//

public protocol AuthService {
    func login(credentials: LoginCredentials) async throws -> AuthToken
}
