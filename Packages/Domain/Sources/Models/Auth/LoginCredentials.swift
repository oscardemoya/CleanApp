//
//  LoginCredentials.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/8.
//

import Foundation
import CleanArchitecture

@Entity
public struct LoginCredentials: Sendable {
    public let username: String
    public let password: String
}
