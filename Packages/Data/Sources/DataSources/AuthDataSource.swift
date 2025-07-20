//
//  AuthDataSource.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/6.
//

import Networking
import CleanArchitecture

protocol AuthDataSource: Sendable {
    func login(credentials: any Codable) async throws -> AuthTokenData
}

@Configurable<RemoteDataSourceConfig>
final class DefaultAuthDataSource: AuthDataSource, RemoteDataSource {
    func login(credentials: any Codable) async throws -> AuthTokenData {
        try await apiClient.post("/auth/login", body: credentials.jsonBody).value
    }
}
