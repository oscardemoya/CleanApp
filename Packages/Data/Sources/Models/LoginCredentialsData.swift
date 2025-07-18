//
//  LoginCredentials.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/8.
//

import CleanArchitecture
import Domain
import Foundation

@ModelConvertible
public struct LoginCredentialsData: Codable {
    let username: String
    let password: String
}
