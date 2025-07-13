//
//  LoginUseCase.swift
//  Domain
//
//  Created by Oscar De Moya on 10/7/24.
//

import Foundation
import CleanArchitecture

@Injectable<AuthRepository & TokenRepository>
public struct LoginUseCase: Sendable {
    public func execute(credentials: LoginCredentials) async throws -> AuthToken {
        let token = try await authRepository.login(credentials: credentials)
        try tokenRepository.save(token: token)
        return token
    }
}
