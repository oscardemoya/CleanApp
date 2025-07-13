//
//  KeychainDataSource.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Toolkit
import Domain

public typealias AppKeychainManager = KeychainManager<AppKeychainKey>

public protocol SecureStorageDataSource: ConfigurableDataSource where Configuration == SecureDataSourceConfig {
    var keychain: AppKeychainManager { get }
}

public extension SecureStorageDataSource {
    var keychain: AppKeychainManager { configuration.keychain }
}
