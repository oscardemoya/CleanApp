//
//  AuthRepository.swift
//  Domain
//
//  Created by Oscar De Moya on 9/25/24.
//

import Foundation

public protocol AuthRepository: Sendable {
    func login(credentials: LoginCredentials) async throws -> AuthToken
    func resetPassword(request: ResetPasswordRequest) async throws -> ResetPasswordResponse
}
