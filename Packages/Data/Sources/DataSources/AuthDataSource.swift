//
//  AuthDataSource.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/6.
//

import Networking

protocol AuthDataSource: Sendable {
    func login(credentials: any Codable) async throws -> AuthTokenData
}

final class DefaultAuthDataSource: AuthDataSource, RemoteDataSource {
    let configuration: RemoteDataSourceConfig
    
    required init(configuration: RemoteDataSourceConfig) {
        self.configuration = configuration
    }
    
    func login(credentials: any Codable) async throws -> AuthTokenData {
        try await apiClient.post("/auth/login", body: credentials.jsonHTTPBody).value
    }
}
