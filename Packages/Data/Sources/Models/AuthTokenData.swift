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
struct AuthTokenData: Codable {
    var id: Int
    var email: String
    var username: String?
    var firstName: String?
    var lastName: String?
    var image: String?
    var accessToken: String?
    var refreshToken: String?
}
