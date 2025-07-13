//
//  AuthError.swift
//  Domain
//
//  Created by Oscar De Moya on 9/25/24.
//

import Foundation

public enum AuthError: LocalizedError {
    case unauthenticated
    case invalidConfiguration
    case invalidCredentials
    case invalidToken
    case invalidUser
    case canceled
    
    public var errorDescription: String? {
        switch self {
        case .unauthenticated: String(localized: "User is not authenticated.")
        case .invalidConfiguration: String(localized: "Invalid configuration.")
        case .invalidCredentials: String(localized: "Invalid credentials.")
        case .invalidToken: String(localized: "Invalid token.")
        case .invalidUser: String(localized: "Invalid user.")
        case .canceled: String(localized: "Authentication was canceled.")
        }
    }
}
