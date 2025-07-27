//
//  AuthService.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/8.
//

public protocol AuthService: Sendable {
    func login(credentials: LoginCredentials) async throws -> AuthToken
    func currentAuthToken() throws -> AuthToken
    func logout() throws
    func resetPassword(request: ResetPasswordRequest) async throws -> ResetPasswordResponse
}
