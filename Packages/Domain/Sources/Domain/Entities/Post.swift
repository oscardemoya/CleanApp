//
//  Post.swift
//  Domain
//
//  Created by Oscar De Moya on 5/10/22.
//

import Foundation

struct Post: Codable, Identifiable {
    typealias Identifier = Int
    var id: Identifier
    var userId: Int
    var title: String
    var body: String
}
