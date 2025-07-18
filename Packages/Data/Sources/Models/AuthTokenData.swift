//
//  AuthTokenData.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/7.
//

import CleanArchitecture
import Domain
import Foundation

@ModelConvertible
public struct AuthTokenData: Codable {
    public var id: Int
    public var email: String
    public var username: String
    public var firstName: String
    public var lastName: String
    public var image: String
    public var accessToken: String
    public var refreshToken: String
}
