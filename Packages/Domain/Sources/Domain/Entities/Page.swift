//
//  Page.swift
//  Domain
//
//  Created by Oscar De Moya on 6/10/22.
//

import Foundation

public protocol Page<Index> {
    associatedtype Index
    var offset: Index { get }
    var limit: Int { get }
}

public struct AnyPage<Index>: Page {
    public let offset: Index
    public let limit: Int
    
    public init(offset: Index, limit: Int) {
        self.offset = offset
        self.limit = limit
    }
}
