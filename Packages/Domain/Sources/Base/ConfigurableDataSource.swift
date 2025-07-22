//
//  ConfigurableDataSource.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/6.
//

public protocol ConfigurableDataSource: Sendable {
    associatedtype Configuration
    
    var configuration: Configuration { get }
    init(configuration: Configuration)
}
