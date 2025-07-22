//
//  AuthDataSource.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/6.
//

import CleanArchitecture
import Networking

protocol AuthDataSource: RemoteDataSource, Sendable {
    func login(credentials: any Codable) async throws -> AuthTokenData
    func resetPassword(email: String) async throws -> ResetPasswordResponseData
}

@Configurable<RemoteDataSourceConfig>
final class DefaultAuthDataSource: AuthDataSource, Sendable {
    func login(credentials: any Codable) async throws -> AuthTokenData {
        try await apiClient.post("/auth/login", body: credentials.jsonBody).value
    }
    
    func resetPassword(email: String) async throws -> ResetPasswordResponseData {
        try await apiClient.get("/auth/reset_password", queryItems: ["email": email]).value
    }
}
