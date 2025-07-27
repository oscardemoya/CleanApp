//
//  DataSourceFactory.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Toolkit
import Networking
import Data

extension DataSourceFactory {
    init(environment: AppEnvironment = .current) {
        let apiClient = APIClient.shared(environment: environment)
        let keychainManager = AppKeychainManager()
        self.init(
            remoteDataSourceConfig: DefaultRemoteDataSourceConfig(apiClient: apiClient),
            secureDataSourceConfig: DefaultSecureDataSourceConfig(keychain: keychainManager)
        )
    }
}
