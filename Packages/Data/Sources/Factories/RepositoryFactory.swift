//
//  RepositoryFactory.swift
//  Data
//
//  Created by Oscar De Moya on 10/11/24.
//

import CleanArchitecture
import Domain

@Injectable<DataSourceFactory>
public struct RepositoryFactory {
    #MakeRepository<AuthRepository>()
    #MakeRepository<TokenRepository>()
}
