//
//  DefaultAuthRepository.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/6.
//

import CleanArchitecture
import Domain

@Injectable<any AuthDataSource>
final class DefaultAuthRepository: AuthRepository, Sendable {
    func login(credentials: LoginCredentials) async throws -> AuthToken {
        try await authDataSource.login(credentials: LoginCredentialsData(entity: credentials)).asDomainEntity
    }
    
    func resetPassword(request: ResetPasswordRequest) async throws -> ResetPasswordResponse {
        try await authDataSource.resetPassword(email: request.username).asDomainEntity
    }
}
