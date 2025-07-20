//
//  SecureDataSourceConfig.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Toolkit
import Domain

public protocol SecureDataSourceConfig: Sendable {
    var keychain: AppKeychainManager { get }
}

public struct DefaultSecureDataSourceConfig: SecureDataSourceConfig, @unchecked Sendable {
    public let keychain: AppKeychainManager
    
    public init(keychain: AppKeychainManager) {
        self.keychain = keychain
    }
}
