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
    
    func login(credentials: LoginCredentials) async throws -> AuthToken {
        try await loginUseCase.execute(credentials: credentials)
    }
}
