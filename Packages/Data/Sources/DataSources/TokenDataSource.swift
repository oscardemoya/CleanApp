//
//  TokenDataSource.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Toolkit

protocol TokenDataSource: Sendable {
    func save(token: any Codable) throws
}

final class DefaultTokenDataSource: TokenDataSource, SecureStorageDataSource {
    let configuration: SecureDataSourceConfig
    
    required init(configuration: SecureDataSourceConfig) {
        self.configuration = configuration
    }
    
    func save(token: any Codable) throws {
        try keychain.save(token, for: .authToken)
    }
}
