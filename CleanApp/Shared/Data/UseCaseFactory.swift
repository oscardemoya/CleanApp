//
//  UseCaseFactory.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/8.
//

import Data

extension UseCaseFactory {
    init(environment: AppEnvironment = .current) {
        let dataSourceFactory = DataSourceFactory(environment: environment)
        let repositoryFactory = RepositoryFactory(dataSourceFactory: dataSourceFactory)
        self.init(repositoryFactory: repositoryFactory)
    }
}
