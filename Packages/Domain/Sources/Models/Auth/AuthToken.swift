//
//  AuthToken.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/5.
//

import Foundation
import CleanArchitecture

@Entity
public struct AuthToken: Equatable, Sendable {
    public var id: Int
    public var email: String
    public var username: String?
    public var firstName: String?
    public var lastName: String?
    public var image: String?
    public var accessToken: String?
    public var refreshToken: String?
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        guard lhs.id == rhs.id else { return false }
        guard lhs.email == rhs.email else { return false }
        guard lhs.username == rhs.username else { return false }
        guard lhs.firstName == rhs.firstName else { return false }
        guard lhs.lastName == rhs.lastName else { return false }
        guard lhs.image == rhs.image else { return false }
        guard lhs.accessToken == rhs.accessToken else { return false }
        guard lhs.refreshToken == rhs.refreshToken else { return false }
        return true
    }
}
