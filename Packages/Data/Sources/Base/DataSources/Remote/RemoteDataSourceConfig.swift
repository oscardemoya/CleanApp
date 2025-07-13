//
//  RemoteDataSourceConfig.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Networking
import Domain

public protocol RemoteDataSourceConfig: Sendable {
    var apiClient: APIClient { get }
}

public struct DefaultRemoteDataSourceConfig: RemoteDataSourceConfig {
    public let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}
