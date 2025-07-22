//
//  TokenDataSource.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/12.
//

import CleanArchitecture
import Toolkit

protocol TokenDataSource: SecureStorageDataSource {
    func save(token: any Codable) throws
    func currentAuthToken() throws -> AuthTokenData
    func deleteCurrentAuthToken() throws
}

@Configurable<SecureDataSourceConfig>
final class DefaultTokenDataSource: TokenDataSource, Sendable {
    func save(token: any Codable) throws {
        try keychain.save(token, for: .authToken)
    }
    
    func currentAuthToken() throws -> AuthTokenData {
        try keychain.getObject(AuthTokenData.self, for: .authToken)
    }
    
    func deleteCurrentAuthToken() throws {
        try keychain.delete(key: .authToken)
    }
}
