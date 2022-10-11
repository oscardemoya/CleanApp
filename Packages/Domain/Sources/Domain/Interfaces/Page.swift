//
//  Page.swift
//  Domain
//
//  Created by Oscar De Moya on 6/10/22.
//

import Foundation

public struct Page {
    let offset: Int
    let limit: Int
    
    public init(offset: Int, limit: Int) {
        self.offset = offset
        self.limit = limit
    }
}
