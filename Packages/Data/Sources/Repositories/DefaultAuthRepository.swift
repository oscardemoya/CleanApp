//
//  DefaultAuthRepository.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/6.
//

import CleanArchitecture
import Domain

@Injectable<AuthDataSource>
final class DefaultAuthRepository: AuthRepository {
    func login(credentials: LoginCredentials) async throws -> AuthToken {
        try await authDataSource.login(credentials: credentials.asDataModel).asDomainEntity
    }
}
