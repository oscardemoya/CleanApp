//
//  AuthToken.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/5.
//

import Foundation

public struct AuthToken {
    public var id: Int
    public var email: String
    public var username: String
    public var firstName: String
    public var lastName: String
    public var image: String
    public var accessToken: String
    public var refreshToken: String
    
    public init(
        id: Int,
        email: String,
        username: String,
        firstName: String,
        lastName: String,
        image: String,
        accessToken: String,
        refreshToken: String
    ) {
        self.id = id
        self.email = email
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
