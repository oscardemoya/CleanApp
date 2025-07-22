//
//  ResetPasswordUseCase.swift
//  Domain
//
//  Created by Oscar De Moya on 10/7/24.
//

import Foundation
import CleanArchitecture

@Injectable<AuthRepository>
public struct ResetPasswordUseCase: Sendable {
    public func execute(request: ResetPasswordRequest) async throws -> ResetPasswordResponse {
        try await authRepository.resetPassword(request: request)
    }
}
