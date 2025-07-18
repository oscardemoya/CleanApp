//
//  AuthToken.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/5.
//

import CleanArchitecture
import Foundation

@Entity
public struct AuthToken {
    public var id: Int
    public var email: String
    public var username: String
    public var firstName: String
    public var lastName: String
    public var image: String
    public var accessToken: String
    public var refreshToken: String
}
