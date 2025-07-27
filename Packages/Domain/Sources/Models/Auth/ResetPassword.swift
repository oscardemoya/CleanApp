//
//  ResetPassword.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/8.
//

import Foundation
import CleanArchitecture

@Entity
public struct ResetPasswordRequest: Sendable {
    public let username: String
}

@Entity
public struct ResetPasswordResponse: Equatable, Sendable {
    public let username: String
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        guard lhs.username == rhs.username else { return false }
        return true
    }
}
