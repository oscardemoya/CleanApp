//
//  LoginCredentials.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/8.
//

import Foundation

public struct LoginCredentials: Codable {
    public let username: String
    public let password: String
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
