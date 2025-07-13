//
//  TokenDataSource.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Toolkit
import CleanArchitecture

protocol TokenDataSource: Sendable {
    func save(token: any Codable) throws
}

@Configurable<SecureDataSourceConfig>
final class DefaultTokenDataSource: TokenDataSource, SecureStorageDataSource {
    func save(token: any Codable) throws {
        try keychain.save(token, for: .authToken)
    }
}
