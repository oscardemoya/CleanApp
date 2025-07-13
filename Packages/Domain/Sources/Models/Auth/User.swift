//
//  User.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/5.
//

import Foundation

public struct User: Identifiable {
    public var id: String
    
    public init(
        id: String
    ) {
        self.id = id
    }
}
