//
//  RemoteDataSource.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/6.
//

import Networking
import Domain

public protocol RemoteDataSource: ConfigurableDataSource where Configuration == RemoteDataSourceConfig {
    var apiClient: APIClient { get }
}

public extension RemoteDataSource {
    var apiClient: APIClient { configuration.apiClient }
}
