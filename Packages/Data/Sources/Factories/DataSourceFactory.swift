//
//  DataSourceFactory.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/6.
//

import CleanArchitecture
import Networking

@Injectable<RemoteDataSourceConfig & SecureDataSourceConfig>
public struct DataSourceFactory {
    #MakeDataSource<any AuthDataSource, RemoteDataSourceConfig>()
    #MakeDataSource<any TokenDataSource, SecureDataSourceConfig>()
}
