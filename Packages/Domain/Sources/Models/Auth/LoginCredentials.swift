//
//  LoginCredentials.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/8.
//

import CleanArchitecture
import Foundation

@Entity
public struct LoginCredentials: Codable, Sendable {
    public let username: String
    public let password: String
}
