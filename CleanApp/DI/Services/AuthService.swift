//
//  AuthService.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/6.
//

import SwiftUI
import CleanArchitecture
import Domain
import Data

@MainActor
@Observable
@AppService<UseCaseFactory>
final class DefaultAuthService: AuthService {
    var currentUser: User?
    private let loginUseCase: LoginUseCase
    private let currentAuthTokenUseCase: CurrentAuthTokenUseCase
    private let logoutUseCase: LogoutUseCase
    private let resetPasswordUseCase: ResetPasswordUseCase
    
    func login(credentials: LoginCredentials) async throws -> AuthToken {
        try await loginUseCase.execute(credentials: credentials)
    }
    
    func currentAuthToken() throws -> AuthToken {
        try currentAuthTokenUseCase.execute()
    }
    
    func logout() throws {
        try logoutUseCase.execute()
    }
    
    func resetPassword(request: ResetPasswordRequest) async throws -> ResetPasswordResponse {
        try await resetPasswordUseCase.execute(request: request)
    }
}
