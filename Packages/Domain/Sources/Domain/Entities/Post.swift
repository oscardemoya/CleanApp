//
//  Post.swift
//  Domain
//
//  Created by Oscar De Moya on 5/10/22.
//

import Foundation

public struct Post: Codable, Identifiable, Hashable {
    public typealias Identifier = Int
    public var id: Identifier
    public var userId: Int
    public var title: String
    public var body: String
    
    public init(id: Identifier, userId: Int, title: String, body: String) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
}
